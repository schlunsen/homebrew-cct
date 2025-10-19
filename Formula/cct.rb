class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.5.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.3/cct-darwin-arm64"
      sha256 "4675e367b356597043a4b722228b524e37c4ff229765fb2772c4a912fee5a291"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.3/cct-darwin-amd64"
      sha256 "0c9eac9653a5c71a8ba967cb9f278629126a12207a8f0a869ea50c61beec4ed4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.4.4/cct-linux-arm64"
      sha256 "e67019a16f30ffc9caa2fd2967ae34a273f79b4312ddcc6b891290daa647cef3"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.3/cct-linux-amd64"
      sha256 "995c1dc73e3ab86faa12d1e988f1ae056d5ebea2dd0f6019108a82f92e6dddb3"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
