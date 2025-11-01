class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.12.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.12.1/cct-darwin-arm64"
      sha256 "be0c64c6645ef18399e482f83775c4548d23a66e3760491f57aeb700e8e0a4db"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.12.1/cct-darwin-amd64"
      sha256 "41a078f5e68dc24109f0eec1a423436b5c031b20da53dcdeb85a525646a98b39"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.10.2/cct-linux-arm64"
      sha256 "8bafd039270d3fd00b4c161039de9568dec2a612d9684bc8fe307fb9ba992f41"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.12.1/cct-linux-amd64"
      sha256 "780a8d5f2df78eec1ccfdebb32a18b575cccec0becc97bfbd1820b5c1cfd7337"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
