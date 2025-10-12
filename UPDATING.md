# Updating the CCT Formula

This guide explains how to update the CCT formula when a new version is released.

## Prerequisites

- Access to push to this repository
- `curl` and `shasum` installed (available by default on macOS/Linux)

## Update Process

### 1. Check for New Release

Visit the CCT releases page:
https://github.com/schlunsen/claude-templates-go/releases

Note the new version number (e.g., `v0.0.2`).

### 2. Download and Calculate SHA256 Checksums

For each platform, download the binary and calculate its SHA256:

```bash
# Set the version
VERSION="0.0.2"

# macOS ARM64
curl -L "https://github.com/schlunsen/claude-templates-go/releases/download/v${VERSION}/cct-darwin-arm64.zip" -o cct-darwin-arm64.zip
shasum -a 256 cct-darwin-arm64.zip

# macOS AMD64
curl -L "https://github.com/schlunsen/claude-templates-go/releases/download/v${VERSION}/cct-darwin-amd64.zip" -o cct-darwin-amd64.zip
shasum -a 256 cct-darwin-amd64.zip

# Linux ARM64
curl -L "https://github.com/schlunsen/claude-templates-go/releases/download/v${VERSION}/cct-linux-arm64.tar.gz" -o cct-linux-arm64.tar.gz
shasum -a 256 cct-linux-arm64.tar.gz

# Linux AMD64
curl -L "https://github.com/schlunsen/claude-templates-go/releases/download/v${VERSION}/cct-linux-amd64.tar.gz" -o cct-linux-amd64.tar.gz
shasum -a 256 cct-linux-amd64.tar.gz
```

### 3. Update the Formula

Edit `Formula/cct.rb` and update:

1. **Version number** (line ~4):
   ```ruby
   version "0.0.2"
   ```

2. **SHA256 checksums** for each platform (lines ~7-22):
   ```ruby
   if OS.mac? && Hardware::CPU.arm?
     url "https://github.com/schlunsen/claude-templates-go/releases/download/v#{version}/cct-darwin-arm64.zip"
     sha256 "NEW_SHA256_HERE"
   elsif OS.mac? && Hardware::CPU.intel?
     url "https://github.com/schlunsen/claude-templates-go/releases/download/v#{version}/cct-darwin-amd64.zip"
     sha256 "NEW_SHA256_HERE"
   elsif OS.linux? && Hardware::CPU.arm?
     url "https://github.com/schlunsen/claude-templates-go/releases/download/v#{version}/cct-linux-arm64.tar.gz"
     sha256 "NEW_SHA256_HERE"
   elsif OS.linux? && Hardware::CPU.intel?
     url "https://github.com/schlunsen/claude-templates-go/releases/download/v#{version}/cct-linux-amd64.tar.gz"
     sha256 "NEW_SHA256_HERE"
   end
   ```

### 4. Test the Formula

Test the formula locally before committing:

```bash
# Audit the formula
brew audit --strict --online Formula/cct.rb

# Test installation
brew install --build-from-source Formula/cct.rb

# Verify it works
cct --version
cct --help

# Uninstall test version
brew uninstall cct
```

### 5. Update CHANGELOG.md

Add a new entry to `CHANGELOG.md`:

```markdown
## [0.0.2] - YYYY-MM-DD

### Changed
- Updated to CCT version 0.0.2
- [List any notable changes from the release notes]

[0.0.2]: https://github.com/schlunsen/claude-templates-go/releases/tag/v0.0.2
```

### 6. Commit and Push

```bash
git add Formula/cct.rb CHANGELOG.md
git commit -m "chore: update cct formula to v0.0.2"
git push origin main
```

### 7. Create a Git Tag (Optional)

```bash
git tag v0.0.2
git push origin v0.0.2
```

## Verification

After pushing, verify the formula works:

```bash
# Update tap
brew update

# Upgrade cct
brew upgrade cct

# Verify version
cct --version
```

## Troubleshooting

### SHA256 Mismatch Error

If users report SHA256 mismatch errors:
1. Re-download the binary from the release
2. Recalculate the SHA256
3. Verify the checksum matches what's in the formula
4. Push a fix if needed

### Installation Failures

If installation fails:
1. Check that the release exists on GitHub
2. Verify all download URLs are correct
3. Test on both macOS and Linux if possible
4. Check the GitHub Actions workflow for automated test results

## Automation Ideas

Consider automating this process with:
- A script to fetch and calculate all checksums
- GitHub Actions workflow triggered by new releases
- Automated PR creation using `bump-formula-pr` from Homebrew
