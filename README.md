# SimpleVenom

![ShellCheck](https://github.com/ByCh4n/SimpleVenom/actions/workflows/shellcheck.yml/badge.svg)
![License](https://img.shields.io/github/license/ByCh4n/SimpleVenom)
![Stars](https://img.shields.io/github/stars/ByCh4n/SimpleVenom?style=social)

**Community / Support:** [Discord](https://discord.gg/6zEu3hC9uR)

SimpleVenom is a robust wrapper for generating Metasploit payloads, offering three different user interfaces: GUI (Zenity), TUI (Dialog), and a standard CLI Shell. It automatically detects your installed tools to provide the best possible experience.

## Features

- **Multi-Interface Support**:
  - **GUI Mode**: Full graphical interface using `zenity`.
  - **TUI Mode**: Terminal-based menu interface using `dialog`.
  - **Shell Mode**: Interactive command-line wizard.
- **Smart Auto-Detection**: Automatically selects the best available interface.
- **Dependency Management**: Checks for required tools at startup.
- **Payload Support**: Easily generate payloads for Windows, Android, and Linux.

## Requirements

This script relies on `msfvenom` (part of the Metasploit Framework) for payload generation.

### Essential
- `bash`
- `metasploit-framework`

### Optional (For Interface Modes)
- `zenity` (for GUI mode)
- `dialog` (for TUI mode)

## Installation

```bash
git clone https://github.com/ByCh4n/SimpleVenom
cd SimpleVenom
chmod u+x simplevenom.sh
./simplevenom.sh
```

## Usage

You can run the script without arguments to let it auto-detect the best mode, or force a specific mode using flags:

```bash
./simplevenom.sh [OPTIONS]
```

### Options

| Flag | Description |
|------|-------------|
| `-g`, `--gui` | Force GUI Mode (Zenity) |
| `-t`, `--tui` | Force TUI Mode (Dialog) |
| `-s`, `--shell` | Force Shell Mode (CLI) |
| `-h`, `--help` | Show help message |
| `-v`, `--version` | Show version information |

## Examples

**Run in GUI mode explicitly:**
```bash
./simplevenom.sh --gui
```

**Get help:**
```bash
./simplevenom.sh --help
```

## Developers

- **ByCh4n**
- **lazypwny**

## License

This project is licensed under the [MIT License](https://choosealicense.com/licenses/mit/).
