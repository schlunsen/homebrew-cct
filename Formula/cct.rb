class Cct < Formula
  desc "High-performance CLI tool for Claude Code component templates and analytics"
  homepage "https://github.com/schlunsen/claude-templates-go"
  version "0.0.1"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.0.1/cct-darwin-arm64"
      sha256 "34636345f163abc66cad74ce780311a1bace10679887025627ff000a5abcc89d"
    else
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.0.1/cct-darwin-amd64"
      sha256 "51c953339d1f49eff0d20059aeb4b993bad30597a78ae01d39969cbc7543e82a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.0.1/cct-linux-arm64"
      sha256 "5329cc034234d9d9af82a67ad02d6bf2cfcdaac8ec71be8367b63e6b0196aa9c"
    else
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.0.1/cct-linux-amd64"
      sha256 "229bcc5e8c675635b4f8349de30691255e33951e10a19b306e8a20c487274e03"
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
