class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.2.18"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.18/cct-darwin-arm64"
      sha256 "d480928c98c74b9d5886348d607a4f05b4653fc3b9a2d4d1cf7b4de5227c53f8"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.18/cct-darwin-amd64"
      sha256 "0fc1a96fc715e08f6a82a46fa52898c077252e5be7f5c00f9f20581350e7df6c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.18/cct-linux-arm64"
      sha256 "5b438ffc61ac60078404fdca8e374e6de41d26ce02b5425ea00b3c9e823dacc8"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.18/cct-linux-amd64"
      sha256 "ec00098d9603946bc8ae34285e9767b848186324d9faf332d9236b5a8816f475"
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
