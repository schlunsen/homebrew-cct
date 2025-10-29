class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.10.9"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.10.9/cct-darwin-arm64"
      sha256 "60e9fd6fb8f0267e7936c45b3e653f0b1c1152d79108ed2b374b0c18d39f05ee"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.10.9/cct-darwin-amd64"
      sha256 "f24e36ab088bd6d927236cab46a4380be0c5dc47b4658c0926fdcccfb0f57665"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.10.2/cct-linux-arm64"
      sha256 "8bafd039270d3fd00b4c161039de9568dec2a612d9684bc8fe307fb9ba992f41"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.10.9/cct-linux-amd64"
      sha256 "4315e2f8f957a4819ab2b48d00c8d35005911b650a0b4534cb526fb5deeed43b"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
