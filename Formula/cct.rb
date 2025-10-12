class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.2.3"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.3/cct-darwin-arm64"
      sha256 "55d03eca921e96b52c342e4af08e33a07b8770885a98b9f84b5b72429144a302"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.3/cct-darwin-amd64"
      sha256 "6d8c84c6d1a75ce64728c83b36acd7ad9a38ec1f9a3a296e056c4b3e80824ed4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.3/cct-linux-arm64"
      sha256 "298999201259c8cf1dedd2a3c85030356682278a89a85fab28000049777402b7"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.3/cct-linux-amd64"
      sha256 "9ba5d14a63545513bdff7ffb27c7b7c43674d73df782ec4c01624ee635fd2a85"
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
