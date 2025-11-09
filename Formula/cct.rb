class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.14.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.14.0/cct-darwin-arm64"
      sha256 "1cd96aa33973c87feeb5b06e0cb2d0a21883dee75e16674987063bf61c7f088b"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.14.0/cct-darwin-amd64"
      sha256 "bae84b2361312b333a73246c25944f1f226c52aa9de97b9f0e6a7db078b04145"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.10.2/cct-linux-arm64"
      sha256 "8bafd039270d3fd00b4c161039de9568dec2a612d9684bc8fe307fb9ba992f41"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.14.0/cct-linux-amd64"
      sha256 "a97597694c517cd79f61891bd53b42f07dc7a73b536d5fb9b578072334f955d6"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
