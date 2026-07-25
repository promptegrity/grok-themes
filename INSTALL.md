# Grok Themes

Themes extracted from [xai-org/grok-build](https://github.com/xai-org/grok-build) (GrokNight / GrokDay).

## Layout

```
palette.toml          # reference palettes (both)
palette.css           # CSS variables (both)
ghostty/grok-night    # Ghostty dark
ghostty/grok-day      # Ghostty light
nushell/grok-night.nu # Nushell syntax/table colors
nushell/grok-day.nu
starship/starship.toml # muted powerline (palette = grok_night)
```

## Ghostty

```sh
mkdir -p ~/.config/ghostty/themes
cp ghostty/grok-night ghostty/grok-day ~/.config/ghostty/themes/
```

In `~/.config/ghostty/config`:

```
theme = light:grok-day,dark:grok-night
```

Or force dark: `theme = grok-night`

Reload: `Cmd+Shift+,`

## Nushell

```sh
mkdir -p "$HOME/Library/Application Support/nushell/themes"
cp nushell/*.nu "$HOME/Library/Application Support/nushell/themes/"
```

In `config.nu`:

```nu
source ($nu.default-config-dir | path join "themes/grok-night.nu")
```

## Starship (powerline)

```sh
cp starship/starship.toml ~/.config/starship.toml
```

Switch light palette: set `palette = 'grok_day'` in the toml.
