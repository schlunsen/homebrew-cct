class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.2.0"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.0/cct-darwin-arm64"
      sha256 "253d4b19772b9a1a817753b5523a1dfa4a724ff4ee2dcb22d1a573a590f241b4"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.0/cct-darwin-amd64"
      sha256 "41fc2d3bc5f254159ae9a1d6faf639b2fdc87aed1ae27fe19dea90f2e13c3b91"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.0/cct-linux-arm64"
      sha256 "c3e108b49696c39cdc15270cc1f97b5a0247823eca3db8c3ec426932c1e6a1cc"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.0/cct-linux-amd64"
      sha256 "c0a43c8bfae6c92a71f1c92aba2a681fa7eac153e5a15154b9584df278ce55db"
    end
  end

  def install
    # The downloaded file is a precompiled binary
    downloaded_file = Dir["cct-*"].first
    bin.install downloaded_file => "cct"
    chmod 0755, bin/"cct"
  end

  test do
    system "#{bin}/cct", "--help"
  end
end
