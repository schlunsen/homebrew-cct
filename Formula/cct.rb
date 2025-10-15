class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.3.1"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.3.1/cct-darwin-arm64"
      sha256 "a8afe08fb70b827fa66b321a46dea6fe81e8ee76e682995c5b9ee78189b160c0"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.3.1/cct-darwin-amd64"
      sha256 "6aed1cdf94b127ed46beb307c38294a35790b566a53e669042646ff0bb66b220"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.3.1/cct-linux-arm64"
      sha256 "5b438ffc61ac60078404fdca8e374e6de41d26ce02b5425ea00b3c9e823dacc8"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.3.1/cct-linux-amd64"
      sha256 "56dbadf61c6b029330ede54ec5083970da8dc5ec71ae28ae3b0a5b8b0997c50c"
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
