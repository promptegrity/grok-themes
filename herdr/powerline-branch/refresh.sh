#!/usr/bin/env python3
"""Report $pl_branch = " <branch>" for each Herdr workspace (Starship/powerline style)."""
import json
import os
import subprocess
import sys

HERDR = os.environ.get("HERDR_BIN_PATH", "herdr")
SOURCE = "grok.powerline-branch"
GLYPH = "\uf418"  # Nerd Font cod-git-branch / Starship git_branch.symbol


def run_herdr(*args):
    try:
        out = subprocess.check_output([HERDR, *args], text=True, stderr=subprocess.DEVNULL)
        return json.loads(out)
    except Exception:
        return None


def git_branch(cwd):
    if not cwd or not os.path.isdir(cwd):
        return ""
    try:
        branch = subprocess.check_output(
            ["git", "-C", cwd, "branch", "--show-current"],
            text=True,
            stderr=subprocess.DEVNULL,
        ).strip()
        if branch:
            return branch
        return subprocess.check_output(
            ["git", "-C", cwd, "rev-parse", "--short", "HEAD"],
            text=True,
            stderr=subprocess.DEVNULL,
        ).strip()
    except Exception:
        return ""


def main():
    panes_body = run_herdr("pane", "list") or {}
    panes = panes_body.get("result", panes_body).get("panes", [])

    best = {}
    fallback = {}
    for p in panes:
        wid = p.get("workspace_id")
        cwd = p.get("cwd") or p.get("foreground_cwd") or ""
        if not wid or not cwd:
            continue
        if p.get("focused"):
            best[wid] = cwd
        fallback.setdefault(wid, cwd)

    ws_body = run_herdr("workspace", "list") or {}
    workspaces = ws_body.get("result", ws_body).get("workspaces", [])
    ids = [w.get("workspace_id") for w in workspaces if w.get("workspace_id")]
    for wid in list(best) + list(fallback):
        if wid not in ids:
            ids.append(wid)

    for wid in ids:
        cwd = best.get(wid) or fallback.get(wid) or ""
        branch = git_branch(cwd)
        if branch:
            subprocess.run(
                [
                    HERDR,
                    "workspace",
                    "report-metadata",
                    wid,
                    "--source",
                    SOURCE,
                    "--token",
                    f"pl_branch={GLYPH} {branch}",
                ],
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL,
                check=False,
            )
        else:
            subprocess.run(
                [
                    HERDR,
                    "workspace",
                    "report-metadata",
                    wid,
                    "--source",
                    SOURCE,
                    "--clear-token",
                    "pl_branch",
                ],
                stdout=subprocess.DEVNULL,
                stderr=subprocess.DEVNULL,
                check=False,
            )
    return 0


if __name__ == "__main__":
    sys.exit(main())
