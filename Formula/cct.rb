class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.5.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.5/cct-darwin-arm64"
      sha256 "f3cc5187626cedb5b1593da11e95a44b4aeef21d4a2433b1fbca5dcde8913dfb"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.5/cct-darwin-amd64"
      sha256 "fd2f3441923f50bd65a17e0ba2683527ecf92530116c6d5d32f8a7e895ce1cea"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.4.4/cct-linux-arm64"
      sha256 "e67019a16f30ffc9caa2fd2967ae34a273f79b4312ddcc6b891290daa647cef3"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.5/cct-linux-amd64"
      sha256 "3ae0f2fe4f418d12fbb0a611344fe94faaeea466b4d7f205bdbcefd8d38d7956"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
