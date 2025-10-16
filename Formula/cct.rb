class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.4.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.4.1/cct-darwin-arm64"
      sha256 "d0f310c9208cea046a0b866e8e6e1f9ad3fb39d92f574cdafa320377442b6f3b"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.4.1/cct-darwin-amd64"
      sha256 "e043f997f41cdbb6396bf34453d15b11c33a1630f36fab16b9363bb75131bcdb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.4.1/cct-linux-arm64"
      sha256 "ce757e1daec76df7d8eb17ecc3dfdb712f54bfdc9e638c5568f8938420c7def2"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.4.1/cct-linux-amd64"
      sha256 "9f3bfc1235f0e9f42c0485815b6f1308e0234c41b0abb6a5180c5f8716cc6138"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
