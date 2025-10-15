class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.3.2"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.3.2/cct-darwin-arm64"
      sha256 "3051c55ff40b17f52d976af539a8406eddfd921dc0dfdd4d19eeacaab9ad65f4"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.3.2/cct-darwin-amd64"
      sha256 "c469146e7d5d090be440f87f7386c7fc9e06a0ceb8ce85cb955c6ac168ecc40d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.3.2/cct-linux-arm64"
      sha256 "5b438ffc61ac60078404fdca8e374e6de41d26ce02b5425ea00b3c9e823dacc8"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.3.2/cct-linux-amd64"
      sha256 "864906f752c9cc653691f7d05ee4f79bf4cfba64c826e76352f35e5f627aee5b"
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
