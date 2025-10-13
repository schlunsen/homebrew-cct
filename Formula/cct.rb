class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.2.15"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.15/cct-darwin-arm64"
      sha256 "342376c27b7ace76d5035e60f479d8299f8d4da4b8d6fe3977243cf21cb15b44"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.15/cct-darwin-amd64"
      sha256 "ee6bd4f23113d80bda8a4534726b0c83d4bb167d3355c617704bb53e31f31811"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.15/cct-linux-arm64"
      sha256 "5b438ffc61ac60078404fdca8e374e6de41d26ce02b5425ea00b3c9e823dacc8"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.15/cct-linux-amd64"
      sha256 "d976a4f44aefbaae4f24f4233ec120ba19408755037da4ac412fa258fcd7cfb9"
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
