class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.9.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.9.4/cct-darwin-arm64"
      sha256 "e59fc44630e8064e0d367b4b24002a91dd1ece9ec13e4d02c75d888ec59da3b2"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.9.4/cct-darwin-amd64"
      sha256 "b3f1a2624d974686dd5452a3bb66ef2a3603614c112e5bc019920023b52c2df5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.9.4/cct-linux-arm64"
      sha256 "8bafd039270d3fd00b4c161039de9568dec2a612d9684bc8fe307fb9ba992f41"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.9.4/cct-linux-amd64"
      sha256 "1a4bf9225ff6d3d216cf1fd0ddc7f2008dabdd4038126fda1925369f576f4d93"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
