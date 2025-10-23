class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.5.15"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.15/cct-darwin-arm64"
      sha256 "fd5335689137ae63c7233bf3d623a0e0ed722c1fa6f3008ff87af1621274e5fa"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.15/cct-darwin-amd64"
      sha256 "ab462b7c457a54a04af4977a487a709a5314f38d2fee452b3a49bbfb313ffb7a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.15/cct-linux-arm64"
      sha256 "cad41f9d2ff42afe725aa9f6e6716e161fe9c132dd994914dfb29f0ad64e1157"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.15/cct-linux-amd64"
      sha256 "d49c6862cef84ce3f0beb921e4a46d8272382ef38b2ecc4eb0e1a5443cc675be"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
