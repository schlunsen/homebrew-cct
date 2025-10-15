class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.3.3"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.3.3/cct-darwin-arm64"
      sha256 "c775ec970491b94eab9ef8e601665138615683ab31bfdfc92bcb300b481946f8"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.3.3/cct-darwin-amd64"
      sha256 "c02193d8561f25486cd2bed23925018d1aa85863f85aff18c703985f0e701968"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.3.3/cct-linux-arm64"
      sha256 "5b438ffc61ac60078404fdca8e374e6de41d26ce02b5425ea00b3c9e823dacc8"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.3.3/cct-linux-amd64"
      sha256 "79a51a2e2d2a5a24029e095c6346a7e3db01ce2e3c548f732021929c9bc5818e"
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
