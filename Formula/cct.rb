class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.5.12"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.12/cct-darwin-arm64"
      sha256 "a492ebc33bab4629326be76155edb32a7f55b3ad829a249ff0b6268b127a642f"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.12/cct-darwin-amd64"
      sha256 "9509c6b2b3ca31a93dd51104fc8958b5c931346d9fa388a1466aa757cc5535d5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.4.4/cct-linux-arm64"
      sha256 "e67019a16f30ffc9caa2fd2967ae34a273f79b4312ddcc6b891290daa647cef3"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.12/cct-linux-amd64"
      sha256 "ff5f1578bf3e7abc769c1c4ba3e8f6d5da4ad8053aa49accfbd9a6396c08f5bb"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
