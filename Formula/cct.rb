class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.3.0"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.3.0/cct-darwin-arm64"
      sha256 "9fd3e8f5efa694bcd6589936bd378853a2c353b9255b3132fb5f367ae10b134f"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.3.0/cct-darwin-amd64"
      sha256 "39dbbf8c4b49747ac23dfeb42edff0398ab65fe40bd20ed4478cb138aea316f3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.3.0/cct-linux-arm64"
      sha256 "5b438ffc61ac60078404fdca8e374e6de41d26ce02b5425ea00b3c9e823dacc8"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.3.0/cct-linux-amd64"
      sha256 "cdf89e24b689799322b145f7d98f3191956a9bf5a17f3de538fc65a3c34db4e8"
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
