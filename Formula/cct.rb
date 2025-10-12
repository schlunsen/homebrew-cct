class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.2.7"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.7/cct-darwin-arm64"
      sha256 "55e6d95ca9510d8dd77e36c5f5d4aab6de2c85793a72a6d513259b841cda77ce"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.7/cct-darwin-amd64"
      sha256 "4aaea772a27051bb15a349a64d0c28b0d007eab21414127f1fb9ca4f58835973"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.7/cct-linux-arm64"
      sha256 "fa8277ee87515c21a342def04ae8fc0df940032bdd6c7a94635d89d3cd143ab2"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.7/cct-linux-amd64"
      sha256 "b8ad7764ef08ab0c9484d62c53d703a13ca15ddba765c0036d9d537d36e39cd3"
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
