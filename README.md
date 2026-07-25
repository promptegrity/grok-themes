# Grok Themes

Unified **GrokNight** / **GrokDay** themes for everyday tools — Ghostty, Nushell, and Starship.

Palettes adapted from [xai-org/grok-build](https://github.com/xai-org/grok-build).

## Why this exists

I wanted one visual language across the tools I use every day. Catppuccin was my default for a long time — modern, polished, and widely supported — but the purple and pastel accents never quite felt like me.

GrokNight (from grok-build) does. It’s dark, coherent, and professional. Grok and Cursor are also where I spend most of my time, so I adapted that palette into themes for Ghostty, Nushell, and Starship to keep a consistent look across the stack.

## Layout

```
palette.toml           # reference palettes (night + day)
palette.css            # CSS variables for both
ghostty/grok-night     # Ghostty dark
ghostty/grok-day       # Ghostty light
nushell/grok-night.nu  # Nushell syntax / table colors
nushell/grok-day.nu
starship/starship.toml # muted powerline (default: grok_night)
```

## Install

### Ghostty

```sh
mkdir -p ~/.config/ghostty/themes
cp ghostty/grok-night ghostty/grok-day ~/.config/ghostty/themes/
```

In `~/.config/ghostty/config`:

```
theme = light:grok-day,dark:grok-night
```

Or force dark:

```
theme = grok-night
```

Reload with `Cmd+Shift+,` (macOS).

### Nushell

```sh
mkdir -p "$HOME/Library/Application Support/nushell/themes"
cp nushell/*.nu "$HOME/Library/Application Support/nushell/themes/"
```

In `config.nu`:

```nu
source ($nu.default-config-dir | path join "themes/grok-night.nu")
```

Use `grok-day.nu` for the light variant.

### Starship

```sh
cp starship/starship.toml ~/.config/starship.toml
```

Default palette is `grok_night`. For light mode, set:

```toml
palette = 'grok_day'
```

## Palettes

| Token        | GrokNight | GrokDay   |
|--------------|-----------|-----------|
| Background   | `#141414` | `#eeeeee` |
| Foreground   | `#e1e1e1` | `#262626` |
| Magenta      | `#bb9af7` | `#7D4BC6` |
| Blue         | `#7aa2f7` | `#2F64D2` |
| Cyan         | `#7dcfff` | `#0082AA` |
| Green        | `#9ece6a` | `#378E23` |
| Red          | `#f7768e` | `#CD3048` |
| Orange       | `#ff9e64` | `#C3691E` |
| Yellow       | `#e0af68` | `#A27612` |
| Teal         | `#1abc9c` | `#0A8E70` |

Full tokens live in [`palette.toml`](./palette.toml) and [`palette.css`](./palette.css).

## License

Themes are derived from grok-build’s public palette definitions. Use freely for personal config.
