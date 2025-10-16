class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.4.0"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.4.0/cct-darwin-arm64"
      sha256 "f90870ec85d432ccfea5df3d384bb08b71294adabff519b1e7869e799aa499b6"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.4.0/cct-darwin-amd64"
      sha256 "4a2c946eade168cfeb2dfa7929211f98eb3ea26648e292d274ac2b220b2af971"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.4.0/cct-linux-arm64"
      sha256 "de6e4fd17de98ae0486e85612eb59e3c4fdd87ef78fc55be2c08be6279d2ec8e"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.4.0/cct-linux-amd64"
      sha256 "67ab585cea8b370d90edca307481a86ada57373c1d25363906ca7676c6675069"
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
