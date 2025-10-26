class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.9.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.9.0/cct-darwin-arm64"
      sha256 "00fa1fba542b98ad8045264a5aa1803c29cdb4d74b710158364686109a8e7ad2"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.9.0/cct-darwin-amd64"
      sha256 "496f63dbbc2bf6593f96ec7e7b3e6f88fd1016cf339af76ec4fc3de2f3845fdf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.9.0/cct-linux-arm64"
      sha256 "8bafd039270d3fd00b4c161039de9568dec2a612d9684bc8fe307fb9ba992f41"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.9.0/cct-linux-amd64"
      sha256 "f013e305ca5552fcfca396a436d0de441310849daaf07609ea93220e2bd900f5"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
