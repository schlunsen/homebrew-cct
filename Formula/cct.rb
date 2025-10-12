class Cct < Formula
  desc "High-performance CLI tool for Claude Code component templates and analytics"
  homepage "https://github.com/schlunsen/claude-templates-go"
  version "0.0.8"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.0.8/cct-darwin-arm64"
      sha256 "d5d94f93f479c310741ed4ef3df0feacb452a293fb06ae9401191630754ddd99"
    else
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.0.8/cct-darwin-amd64"
      sha256 "68d076f00781a803a5a03e38d3ab69f323e4a8bcd7df17822d2cdbb441dc6439"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.0.8/cct-linux-arm64"
      sha256 "2bb5ec07b4049907968149654d64c9448d60c9e3cfce99da6cad940d958872f5"
    else
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.0.8/cct-linux-amd64"
      sha256 "244df873821a061bceac70050bbe87bf047d394d4c35a944a192440a1e34b12c"
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
