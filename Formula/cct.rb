class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.2.17"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.17/cct-darwin-arm64"
      sha256 "537ee2148642c61618a79591d0317bfabb380e2a97f28809af6c742c23da08f6"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.17/cct-darwin-amd64"
      sha256 "3884bc0fd8a39e5bf2c1bce147c9679b2ffa7a63fb99a31d0e4f44115407091c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.17/cct-linux-arm64"
      sha256 "5b438ffc61ac60078404fdca8e374e6de41d26ce02b5425ea00b3c9e823dacc8"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.17/cct-linux-amd64"
      sha256 "4084096cf8380f879676b1be6938d5333194f6dd18202297f673a308ee674dd5"
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
