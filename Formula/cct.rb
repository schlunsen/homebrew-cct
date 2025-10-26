class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.9.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.9.1/cct-darwin-arm64"
      sha256 "570997dfc67635f0b4724f19a3ed7ff83a0de28d0afc87fc425953a9f137490e"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.9.1/cct-darwin-amd64"
      sha256 "f65fe39f8e9eb86cead54893216fbc2093791a0f0a352a8a667477b281e6f753"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.9.1/cct-linux-arm64"
      sha256 "8bafd039270d3fd00b4c161039de9568dec2a612d9684bc8fe307fb9ba992f41"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.9.1/cct-linux-amd64"
      sha256 "c30af8bf52b4cebc5e806f7a8890417ceaef86ff1b37ba5202cdd1162e6f92cb"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
