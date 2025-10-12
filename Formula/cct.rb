class Cct < Formula
  desc "High-performance CLI tool for Claude Code component templates and analytics"
  homepage "https://github.com/schlunsen/claude-templates-go"
  version "0.1.0"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.1.0/cct-darwin-arm64"
      sha256 "a08cd0700905c9abf7ccc35046c79be248e73c18c726a9b3ad5df26a0314b318"
    else
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.1.0/cct-darwin-amd64"
      sha256 "45b98ded1e43f4cfcf14f0a168ec19ce5658ea9769a068e98cab76cf23fdf929"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.1.0/cct-linux-arm64"
      sha256 "4fc1a64e95c760b66a011f7db92f110f31b73b41b5d05eb0c81c8ee46141ed50"
    else
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.1.0/cct-linux-amd64"
      sha256 "b72ffc94d3fe8a538cd683f3464fe4eaa57f9bc158b497138fb92e38f1d16159"
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
