class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.2.1"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.1/cct-darwin-arm64"
      sha256 "95bb5e3aeba9ddcfb672ea6848884d455a5668d6461fd3418fa2cb7b6a1bcc8b"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.1/cct-darwin-amd64"
      sha256 "9a7380af3c16b102f9500d8c3911090a4725087090d30d79b69f87a40e36666b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.1/cct-linux-arm64"
      sha256 "67f47047a57f953a03d964ba2ca05c7f34cfc7ec535082b167a097887f0c00c2"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.1/cct-linux-amd64"
      sha256 "df507ffc6c5f6fcdeeaa6005a2ac5fe46a4b388ff4133a48ecb7d867682396ae"
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
