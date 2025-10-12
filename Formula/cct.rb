class Cct < Formula
  desc "High-performance CLI tool for Claude Code component templates and analytics"
  homepage "https://github.com/schlunsen/claude-templates-go"
  version "0.0.4"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.0.4/cct-darwin-arm64"
      sha256 "b58e6ea264974bb79045b808b257ec1dc84c6ce2ddb91728a73189f9c808a18e"
    else
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.0.4/cct-darwin-amd64"
      sha256 "1bcceb8bcb6d99a4ca28aefb6a3d661156094f28773c9ab1d1cd4fcc9c46d2db"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.0.4/cct-linux-arm64"
      sha256 "d774276e89fb727e5187a7dad63b03a1a83e7f6fddd04166835f3d494af4f575"
    else
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.0.4/cct-linux-amd64"
      sha256 "57c747208edc5d43a5465d87e3b3cfa76af70aada17897ece0e25be7b88ba2f0"
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
