class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.10.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.10.6/cct-darwin-arm64"
      sha256 "015ab1a5ae9cf716a6f203dbf1b0e2f1f1f218deff45c08e71ab3602747fd6b5"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.10.6/cct-darwin-amd64"
      sha256 "2db871d94ae8db2afa8240fbc08d192720fa39161a6812ce684a4cf3ec9bfc08"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.10.2/cct-linux-arm64"
      sha256 "8bafd039270d3fd00b4c161039de9568dec2a612d9684bc8fe307fb9ba992f41"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.10.6/cct-linux-amd64"
      sha256 "84fa6a7fa6b39e059ee5c0e68af84d9463e3a5d1067237c0b44284d35f10555c"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
