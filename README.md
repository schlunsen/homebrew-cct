# Homebrew Tap for CCT (Cloud Configuration Tool)

[![Homebrew](https://img.shields.io/badge/homebrew-tap-orange.svg)](https://github.com/schlunsen/homebrew-cct)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/schlunsen/homebrew-cct)

This is the official Homebrew tap for **CCT** (Cloud Configuration Tool) - a high-performance CLI tool for Claude Code component templates and analytics.

## What is CCT?

CCT is a high-performance CLI tool built in Go that provides:
- Component template management for Claude Code
- Analytics and insights for your Claude Code projects
- Fast, efficient operations with precompiled binaries
- Cross-platform support (macOS and Linux, both ARM64 and AMD64)

## Installation

### Prerequisites

- [Homebrew](https://brew.sh/) (macOS or Linux)

### Install CCT

To install CCT using Homebrew, first tap this repository:

```bash
brew tap schlunsen/cct
```

Then install CCT:

```bash
brew install cct
```

### One-Line Installation

You can also install CCT directly without explicitly tapping:

```bash
brew install schlunsen/cct/cct
```

## Usage

After installation, you can run CCT from your terminal:

```bash
# Display help information
cct --help

# Run CCT commands
cct [command] [options]
```

For detailed usage instructions and available commands, please refer to the [main CCT project documentation](https://github.com/schlunsen/claude-templates-go).

## Updating

To update CCT to the latest version:

```bash
brew update
brew upgrade cct
```

## Uninstallation

To uninstall CCT:

```bash
brew uninstall cct
```

To remove the tap entirely:

```bash
brew untap schlunsen/cct
```

## Supported Platforms

CCT is available as precompiled binaries for the following platforms:

- **macOS**
  - Apple Silicon (ARM64)
  - Intel (AMD64)
- **Linux**
  - ARM64
  - AMD64

## Development

This tap repository contains the Homebrew formula for CCT. The formula automatically downloads the appropriate precompiled binary for your platform from the [CCT releases](https://github.com/schlunsen/claude-templates-go/releases).

### Formula Location

The formula is located at: `Formula/cct.rb`

### Testing the Formula Locally

To test the formula locally:

```bash
brew install --build-from-source Formula/cct.rb
```

To audit the formula:

```bash
brew audit --strict Formula/cct.rb
```

## Contributing

Contributions are welcome! If you encounter any issues or have suggestions for improvements:

1. Check the [existing issues](https://github.com/schlunsen/homebrew-cct/issues)
2. Create a new issue if your problem or suggestion is not already covered
3. Submit a pull request with your proposed changes

### Reporting Issues

When reporting issues, please include:
- Your operating system and version
- The output of `brew config`
- The complete error message or unexpected behavior
- Steps to reproduce the issue

## Related Projects

- [CCT Main Project](https://github.com/schlunsen/claude-templates-go) - The main CCT repository with source code and documentation

## License

This tap repository is available under the MIT License. See the main CCT project for licensing information about the CCT tool itself.

## Maintainer

This tap is maintained by [@schlunsen](https://github.com/schlunsen).

## Support

For questions, issues, or feature requests:
- Open an issue on [GitHub](https://github.com/schlunsen/homebrew-cct/issues)
- Visit the [main CCT project](https://github.com/schlunsen/claude-templates-go)

---

**Note:** This is a Homebrew tap for distributing CCT. For information about CCT itself, including detailed documentation and usage examples, please visit the [main CCT repository](https://github.com/schlunsen/claude-templates-go).
