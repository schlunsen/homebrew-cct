class Cct < Formula
  desc "High-performance CLI tool for Claude Code component templates and analytics"
  homepage "https://github.com/schlunsen/claude-templates-go"
  version "0.0.3"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.0.3/cct-darwin-arm64"
      sha256 "ea3c38ba0e207caa602b0e27f7cd564932e444721222bb28db2b1a465924e902"
    else
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.0.3/cct-darwin-amd64"
      sha256 "88921ba8d2b3a8f11f6f51973f4232c8c8288f3868c200fb001f76d74dbd812f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.0.3/cct-linux-arm64"
      sha256 "57f1fd46f441eea86454b5850c149adb5dd28050ff2a935c893ed41593e4b03a"
    else
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.0.3/cct-linux-amd64"
      sha256 "8ce6bff0d0132fa8a8d85c7ec454d5d4c9fff8c8165dac427fd5a4af07077118"
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
