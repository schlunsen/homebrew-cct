class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.14.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.14.1/cct-darwin-arm64"
      sha256 "696be518efa3d8329fe59b1c4fcd6fb860ab391ebe5dc79fbe1ec444226bac4d"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.14.1/cct-darwin-amd64"
      sha256 "eee79afe0fc8eea7d21bbd35107ad52f7a368558e89dfc29f917f3406abe8f98"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.10.2/cct-linux-arm64"
      sha256 "8bafd039270d3fd00b4c161039de9568dec2a612d9684bc8fe307fb9ba992f41"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.14.1/cct-linux-amd64"
      sha256 "246e2c5b078b9fcb15a63dabd665083f966848fceaf1af52921a3159a6f1faf8"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
