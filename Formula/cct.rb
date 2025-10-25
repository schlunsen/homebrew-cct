class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.8.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.8.0/cct-darwin-arm64"
      sha256 "8aa9a0d28da4869348b0792752f608f96f3934fb74e52ce3b67f5d954c5f28df"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.8.0/cct-darwin-amd64"
      sha256 "e15fcb206971748d271dc51e6c6eddcc8ce687214ba518afc7f3cc9bb9499d45"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.8.0/cct-linux-arm64"
      sha256 "bb756635e6db4f2a9b6a1888c9cfb233662a960be4d76eaa64f06d7242928029"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.8.0/cct-linux-amd64"
      sha256 "5e0dca8e43235ae283a4a9868b037fb8a221a1c60688c5f5f67593382b035b9f"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
