class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.5.13"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.13/cct-darwin-arm64"
      sha256 "077010e138255625d5ed68074d773a5e8455a6cfb69a5988c7e8d9421593a3f2"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.13/cct-darwin-amd64"
      sha256 "0fc26b50b832ab89fafc83b1e1b32b10553d56bb09933df19a88796404bebc75"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.4.4/cct-linux-arm64"
      sha256 "e67019a16f30ffc9caa2fd2967ae34a273f79b4312ddcc6b891290daa647cef3"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.13/cct-linux-amd64"
      sha256 "061217ad02c84a235141c8bc7b2e4d99d72359d8ed5cdd45757ff584f66fdbd9"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
