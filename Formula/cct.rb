class Cct < Formula
  desc "High-performance CLI tool for Claude Code component templates and analytics"
  homepage "https://github.com/schlunsen/claude-templates-go"
  version "0.0.2"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.0.2/cct-darwin-arm64"
      sha256 "166e6c4440f1607b34e62b317c33bf24d1a470b7b8ad732e6d4b83bcb553cbfd"
    else
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.0.2/cct-darwin-amd64"
      sha256 "061c256555e85f5f8031f99aaee91eb18cbdcb81bd1304402b3259559035fef2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.0.2/cct-linux-arm64"
      sha256 "22fdab92466a0de77ae3472add79b5ed53e40e349259e001e0ba9d52304736ab"
    else
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.0.2/cct-linux-amd64"
      sha256 "e3a4db755d6b81942f1390745754e0de76ab6547f67862dcefa56c75ca381590"
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
