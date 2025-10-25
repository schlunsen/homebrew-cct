class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.7.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.7.1/cct-darwin-arm64"
      sha256 "cf00b291b0dc69133ac4a6427290655d89b5d205ea4bd3b503ddc8d39927a399"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.7.1/cct-darwin-amd64"
      sha256 "71f65aaf62531539f9e5aed76366f21cd82c643fdcd913eecfd59c2e418eb666"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.7.1/cct-linux-arm64"
      sha256 "bb756635e6db4f2a9b6a1888c9cfb233662a960be4d76eaa64f06d7242928029"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.7.1/cct-linux-amd64"
      sha256 "bbb3f5909389d994d3e518f16c5218b48c61d048e97089149b1f3d8e4fc7a282"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
