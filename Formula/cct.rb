class Cct < Formula
  desc "High-performance CLI tool for Claude Code component templates and analytics"
  homepage "https://github.com/schlunsen/claude-templates-go"
  version "0.0.6"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.0.6/cct-darwin-arm64"
      sha256 "48e26ae2cab72b9b9a11093fcaa4023375dded69ef2e52f4bbf6715c2e67cfc8"
    else
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.0.6/cct-darwin-amd64"
      sha256 "dc1058f326d5216bda60f901026f85e19490aae70e5ee2ce3ca4f3d47fdfab76"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.0.6/cct-linux-arm64"
      sha256 "002bf628ffa5d71731917ba3db715cdeceacce3f628b05d0021aad08a66641ce"
    else
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.0.6/cct-linux-amd64"
      sha256 "ad04f8c368b6c7c3bf0a089a8a32f0192e57fd068a5b5397425b76cf47a4caf7"
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
