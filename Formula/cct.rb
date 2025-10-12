class Cct < Formula
  desc "High-performance CLI tool for Claude Code component templates and analytics"
  homepage "https://github.com/schlunsen/claude-templates-go"
  version "0.0.7"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.0.7/cct-darwin-arm64"
      sha256 "3f5e914c0224dfdc3e0a5cc5d3a36f1249ad6325a1f20795239d0ab03275a44f"
    else
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.0.7/cct-darwin-amd64"
      sha256 "097bcb57fd739bc9f2b4c20ad7abcafc6dc6154125697d8024b078432b0b758e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.0.7/cct-linux-arm64"
      sha256 "0f65a5238523031d8953bc17c0f8db687d91a1b517b0a61383d34e2fc04d4695"
    else
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.0.7/cct-linux-amd64"
      sha256 "a22cc75b957596e4af9af9c02a9f2845e5f74a3f0f65dc85ac7b97d095c8d40d"
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
