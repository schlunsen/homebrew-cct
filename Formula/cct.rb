class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.2.4"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.4/cct-darwin-arm64"
      sha256 "5ab7ee364ce0870ad6a918f8eff0e33979f94b4427f20b601ac8095d0a0044c3"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.4/cct-darwin-amd64"
      sha256 "da3c6cc64125ddf3285f58f21b3c2142f285f5d804fe4e940aacafb3d6b20094"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.4/cct-linux-arm64"
      sha256 "50d6a1b16ece85a5d719b23bbeb17c6aa416c2dd92621c7dd16d1028723d62c7"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.4/cct-linux-amd64"
      sha256 "1e43884a4a8bfa9d72109cd8800b97e8466ffb522195ba7075d114f9f39af06a"
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
