# [bottom](https://github.com/ClementTsang/bottom)

A customizable cross-platform graphical process/system monitor.

## Installation

```bash
brew install bottom
```

## Configuration

The configuration file uses the **Catppuccin Frappé** color theme and features a clean, minimal layout:

```
┌─────────────────────────────────────────┐
│                  CPU                    │
├───────────────────┬─────────────────────┤
│      Memory       │      Network        │
├───────────────────┴─────────────────────┤
│               Processes                 │
└─────────────────────────────────────────┘
```

Symlink `bottom.toml` to:
- **Linux/macOS**: `~/.config/bottom/bottom.toml`
- **macOS (alt)**: `~/Library/Application Support/bottom/bottom.toml`

## Key Features

- Dot markers for cleaner graphs
- 1-second refresh rate
- 10-minute data retention
- Minimal process columns: PID, Name, CPU%, Mem%, State
- Temperature in Celsius
- All CPU cores displayed by default

## Essential Key Bindings

- `?` - Help menu
- `/` - Search processes
- `dd` - Kill selected process
- `e` - Expand/collapse process tree
- `s` - Sort processes
- `+/-` - Zoom in/out graphs
- `Tab` - Navigate between widgets
- `q` - Quit
