class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.2.10"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.10/cct-darwin-arm64"
      sha256 "5fd725cf8638f0cdab6f6e9092bb0e287934f98d9ef88a69adbee1513433cc86"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.10/cct-darwin-amd64"
      sha256 "0aca453559a16a92dcd53661b0aa65f72b857017325a06f1570c073c6b82cd5a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.10/cct-linux-arm64"
      sha256 "02b03bbf3565b029d050953feca895703dc1d1389bf1feb71d84098025085cb7"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.10/cct-linux-amd64"
      sha256 "9f3dcb4c9aabe709e14c31e5e697983ee87f962b45f5c51664cd374aa075a7ce"
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
