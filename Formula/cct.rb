class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.2.14"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.14/cct-darwin-arm64"
      sha256 "1ee9c427d39c956c8b77c2a49b6f3b65d20e54da9ae5eaf93d5e9393590bb51e"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.14/cct-darwin-amd64"
      sha256 "19f5f3145afd0295ca74f5a1ff8c95345b0be68403731102423c0dd4bb9452d8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.14/cct-linux-arm64"
      sha256 "5b438ffc61ac60078404fdca8e374e6de41d26ce02b5425ea00b3c9e823dacc8"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.14/cct-linux-amd64"
      sha256 "86a64d596bc4d0a3493fded6584962eae2030f00e09b18e29c34fbd1b482f6e7"
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
