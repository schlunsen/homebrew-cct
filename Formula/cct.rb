class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.2.13"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.13/cct-darwin-arm64"
      sha256 "e933de36f23f3b520ef2edcaa013afd5e312ed0ad0986b8c549621f610f94e5c"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.13/cct-darwin-amd64"
      sha256 "f95bc0f57198637dd5aa2d48c4258f1a8433ba4b2344bb5ad02e3a4d580a5d40"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.13/cct-linux-arm64"
      sha256 "5b438ffc61ac60078404fdca8e374e6de41d26ce02b5425ea00b3c9e823dacc8"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.13/cct-linux-amd64"
      sha256 "87effd1c10572e8840afb0ce1892cad5da6250fe385649d4a81faf7af6891205"
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
