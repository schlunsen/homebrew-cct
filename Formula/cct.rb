class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.8.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.8.1/cct-darwin-arm64"
      sha256 "2770b8f3b1aab106a344710d220819c62e2e29124f0978b183042197c210458c"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.8.1/cct-darwin-amd64"
      sha256 "85e6f32daf07f90c8509d0fd7d4f1031f3377f174601e0604291fe486b37216c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.8.1/cct-linux-arm64"
      sha256 "bb756635e6db4f2a9b6a1888c9cfb233662a960be4d76eaa64f06d7242928029"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.8.1/cct-linux-amd64"
      sha256 "7a2ae024a46d9002faae7e51ef8e235ea32bef51e38c662585a285ed0de424ad"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
