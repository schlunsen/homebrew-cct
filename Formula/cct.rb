class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.2.12"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.12/cct-darwin-arm64"
      sha256 "480ed7838f5d938410225b1e3dbf693920ed03ec64df84b3bdffb8ce50d0fa11"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.12/cct-darwin-amd64"
      sha256 "02f838d5d874d10dcdfd64aa4f7bdb3b859464dc97a177260e5e730b01c5f477"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.12/cct-linux-arm64"
      sha256 "5b438ffc61ac60078404fdca8e374e6de41d26ce02b5425ea00b3c9e823dacc8"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.12/cct-linux-amd64"
      sha256 "4678440ee46bf6d42d8e6653c93ebccb7bf05caa421f323c3f3ed5bb4ab6bdc7"
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
