class Cct < Formula
  desc "High-performance CLI tool for Claude Code component templates and analytics"
  homepage "https://github.com/schlunsen/claude-templates-go"
  version "0.0.9"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.0.9/cct-darwin-arm64"
      sha256 "6f6304fd73f386301814f355e9689b70445682be7b20b1a664618a07c905a861"
    else
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.0.9/cct-darwin-amd64"
      sha256 "72a6e53e9a4d7e7cd1c3c3f2904716b54def171d4b1d4cb3e9e5d00078ed48b6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.0.9/cct-linux-arm64"
      sha256 "bcc2da174dd4dc5508bc53f37330830243224f3c95159ae51ffc9ab3a7d739cb"
    else
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.0.9/cct-linux-amd64"
      sha256 "84c919019cf7d1db9c2612304763ffb01fdf4113c239e6704db2bb39ea658c08"
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
