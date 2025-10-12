class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.2.9"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.9/cct-darwin-arm64"
      sha256 "462c39fb6cecafc71058ae31e9956fcffc609da45d03c57ef30a931f9004cdf9"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.9/cct-darwin-amd64"
      sha256 "7c2a1dadcc251f6054368be75e63f7ed0be85708f30d9d1dbaae0d42b4e86289"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.9/cct-linux-arm64"
      sha256 "fa8277ee87515c21a342def04ae8fc0df940032bdd6c7a94635d89d3cd143ab2"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.9/cct-linux-amd64"
      sha256 "20dfd94f2f28472ad4c2f1f018f8f372f3b1fe8c20041b78035767156fa7e7a7"
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
