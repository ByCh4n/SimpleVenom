<h1 align="center">SimpleVenom</h1>

<p align="center">
  <img src="https://github.com/ByCh4n/SimpleVenom/actions/workflows/shellcheck.yml/badge.svg" alt="ShellCheck" />
  <img src="https://img.shields.io/github/license/ByCh4n/SimpleVenom" alt="License" />
  <img src="https://img.shields.io/github/stars/ByCh4n/SimpleVenom?style=social" alt="Stars" />
</p>

<p align="center"><b>Community / Support:</b> <a href="https://discord.gg/6zEu3hC9uR">Discord</a></p>

SimpleVenom is a robust wrapper for generating Metasploit payloads, offering
three different user interfaces: GUI (Zenity), TUI (Dialog), and a standard CLI
shell. It automatically detects your installed tools to provide the best
possible experience.

## Features

- **Multi-interface support**
  - **GUI mode** — full graphical interface using `zenity`
  - **TUI mode** — terminal menu interface using `dialog`
  - **Shell mode** — interactive command-line wizard
- **Smart auto-detection** — automatically selects the best available interface
- **Dependency management** — checks for required tools at startup
- **Payload support** — generate payloads for Windows, Android, and Linux

## Requirements

SimpleVenom relies on `msfvenom` (part of the Metasploit Framework) for payload
generation.

**Essential**
- `bash`
- `metasploit-framework`

**Optional (for interface modes)**
- `zenity` (GUI mode)
- `dialog` (TUI mode)

## Installation

```bash
git clone https://github.com/ByCh4n/SimpleVenom
cd SimpleVenom
chmod u+x simplevenom.sh
./simplevenom.sh
```

## Usage

Run without arguments to auto-detect the best mode, or force a specific mode:

```bash
./simplevenom.sh [OPTIONS]
```

| Flag | Description |
|------|-------------|
| `-g`, `--gui` | Force GUI mode (Zenity) |
| `-t`, `--tui` | Force TUI mode (Dialog) |
| `-s`, `--shell` | Force shell mode (CLI) |
| `-h`, `--help` | Show the help message |
| `-v`, `--version` | Show version information |

## Examples

**Run in GUI mode explicitly**
```bash
./simplevenom.sh --gui
```

**Get help**
```bash
./simplevenom.sh --help
```

## Disclaimer

SimpleVenom generates offensive payloads and is provided for **authorized
penetration testing and educational purposes only**. Use it exclusively on
systems you own or have explicit permission to test. The author accepts no
liability for misuse.

## Author

**Hüseyin Altıntaş — ByCh4n**

- GitHub: [@ByCh4n](https://github.com/ByCh4n)
- LinkedIn: [huseyinaltns](https://www.linkedin.com/in/huseyinaltns/)
- X: [@huseyinaltns](https://x.com/huseyinaltns)

Co-developed with [@lazypwny751](https://github.com/lazypwny751).

## License

Licensed under the [MIT](LICENSE) license.
