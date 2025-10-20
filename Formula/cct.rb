class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.5.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.9/cct-darwin-arm64"
      sha256 "0a124006561a7788e0a1d2f6d83ce65a0f110670ed8b67287d2d57cbc22dd693"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.9/cct-darwin-amd64"
      sha256 "01409359261747d63f223118cd65c9cfa22c2f8090d6469d249e90f74afd105a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.4.4/cct-linux-arm64"
      sha256 "e67019a16f30ffc9caa2fd2967ae34a273f79b4312ddcc6b891290daa647cef3"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.9/cct-linux-amd64"
      sha256 "71fcafc623237e58cff56691d206cade5eb2e37c3f2337c4ec77eaa7cb0ad6b3"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
