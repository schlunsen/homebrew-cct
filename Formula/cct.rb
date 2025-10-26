class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.9.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.9.2/cct-darwin-arm64"
      sha256 "58488d87ba89719dda3684e58452955b61bf8a28056f301bdd3bb45f67bc227a"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.9.2/cct-darwin-amd64"
      sha256 "68aae6baea10d68572f3fb7c2e88eafe291f27f53ee4719391bf8c4c4dfb611d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.9.2/cct-linux-arm64"
      sha256 "8bafd039270d3fd00b4c161039de9568dec2a612d9684bc8fe307fb9ba992f41"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.9.2/cct-linux-amd64"
      sha256 "d35168856d663611b53e7adbb5cb6b3fa3e8e122213b4fb7a5c0bc11efb8bd87"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
