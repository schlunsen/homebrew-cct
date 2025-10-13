class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.2.11"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.11/cct-darwin-arm64"
      sha256 "357c8eb24e2a3292ce936298bd940873384650263be909d96101cdae0fbf9fb4"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.11/cct-darwin-amd64"
      sha256 "f023485d8d9cba7dfde2b7a5c2667e7f6097ed4a2e53b95f5af133db7f6142e3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.11/cct-linux-arm64"
      sha256 "5b438ffc61ac60078404fdca8e374e6de41d26ce02b5425ea00b3c9e823dacc8"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.11/cct-linux-amd64"
      sha256 "73f11499aa9c0263bf47da36e338a8e2f6a5f57f975d94eaff9a8e3a0a9f882c"
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
