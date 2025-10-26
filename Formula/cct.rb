class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.9.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.9.3/cct-darwin-arm64"
      sha256 "7198de265f052387fe7ef3278f311d0672ead2c1c542661d99fbcfaf5c38ebf1"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.9.3/cct-darwin-amd64"
      sha256 "72160b86e7079baf16dfbd3cdc8fc19f712412538460504c43ad928595c1c3e3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.9.3/cct-linux-arm64"
      sha256 "8bafd039270d3fd00b4c161039de9568dec2a612d9684bc8fe307fb9ba992f41"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.9.3/cct-linux-amd64"
      sha256 "9842c5605559c18e7798c414c84b4f06ef186b2c1e27db8f5807c8bd6e8a472d"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
