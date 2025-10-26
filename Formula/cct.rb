class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.8.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.8.3/cct-darwin-arm64"
      sha256 "0e17f39d5997f49cc4c2596d50dec367adb37f29831ead7290ef8295dcb723b2"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.8.3/cct-darwin-amd64"
      sha256 "1f9d200950c232d8b23d54866ba7b159a2ee58cdc607f68caf717576d8ed9bd8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.8.3/cct-linux-arm64"
      sha256 "8bafd039270d3fd00b4c161039de9568dec2a612d9684bc8fe307fb9ba992f41"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.8.3/cct-linux-amd64"
      sha256 "f3014d852ae6c49673e9695657e6f45f9cbae1ed288deb080c1a7bd4fda38450"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
