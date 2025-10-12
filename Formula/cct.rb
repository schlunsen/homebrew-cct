class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.2.8"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.8/cct-darwin-arm64"
      sha256 "fc047c544ceef36a8258cc792f4ab4701061cfd8c54c2cec5abdb42bb3ddfc97"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.8/cct-darwin-amd64"
      sha256 "3fa6e692050a37e4ab7fa6430263429d38373f0f41366457dc4c6e0a7d818043"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.8/cct-linux-arm64"
      sha256 "fa8277ee87515c21a342def04ae8fc0df940032bdd6c7a94635d89d3cd143ab2"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.8/cct-linux-amd64"
      sha256 "619ad1a3f27eeb3c9c4d3857133a5ff137f49616237547bb8ac3eb93ae859d98"
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
