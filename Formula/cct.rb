class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.2.5"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.5/cct-darwin-arm64"
      sha256 "f026c5f7de6808b6e7cdf8a0d6ce5147d39efa06c8322c8ebc3576abcb5666a6"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.5/cct-darwin-amd64"
      sha256 "006d6ae5e6c1d596f37af5aa398ddf7dd5340f3de06af2af8867747793886eeb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.5/cct-linux-arm64"
      sha256 "72ea18b11f024dde6206d113d938d53b89815e4e3d8f71da9d0a52b3db750daf"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.5/cct-linux-amd64"
      sha256 "438cbc554db7ecf818aaa46863b5d74c3c2ff347b414f407c119a0e901ba5072"
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
