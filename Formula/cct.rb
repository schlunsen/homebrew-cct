class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.4.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.4.4/cct-darwin-arm64"
      sha256 "7ee87451c66d6fc76ac0b96f823fb168fd7e45ed85fe3cc9652430db90ac4d27"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.4.4/cct-darwin-amd64"
      sha256 "8fe939935119f2d21b49afab248c4363c25d7af6f9a8ffcbd77c26d53a01ef55"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.4.4/cct-linux-arm64"
      sha256 "e67019a16f30ffc9caa2fd2967ae34a273f79b4312ddcc6b891290daa647cef3"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.4.4/cct-linux-amd64"
      sha256 "a1a641da072da64a4d7b8125966882dba3b080c4c97f74668b15e3847d866789"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
