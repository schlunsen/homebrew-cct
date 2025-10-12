class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.2.5"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.5/cct-darwin-arm64"
      sha256 "dbe308b868d3d8b3bfdb5c2e64d5161e4ded5b7c9d304c68b9e1d22ef05db311"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.5/cct-darwin-amd64"
      sha256 "a3955687ed890073605f5c524120bf1da7717685e39fcac1b8a6cab2fb64c37e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.5/cct-linux-arm64"
      sha256 "fa8277ee87515c21a342def04ae8fc0df940032bdd6c7a94635d89d3cd143ab2"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.5/cct-linux-amd64"
      sha256 "007423317bebe4dfe82bbf8c616694310c3d646aa628c52afb562415caa35bcc"
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
