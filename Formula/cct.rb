class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.8.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.8.2/cct-darwin-arm64"
      sha256 "8c5d60ed69b079144896e018ffc5f0a3f49536982a69ec701d8cb7ed5dc8a81f"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.8.2/cct-darwin-amd64"
      sha256 "792ce90471dbbda07f3eb3c8d012403381b5d2f52962992b029e5bb63d14abd5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.8.2/cct-linux-arm64"
      sha256 "bb756635e6db4f2a9b6a1888c9cfb233662a960be4d76eaa64f06d7242928029"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.8.2/cct-linux-amd64"
      sha256 "ffd0db90bf5ddd3c24e510b60a9c467cc535742307655bc64a2f0a07b319e03e"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
