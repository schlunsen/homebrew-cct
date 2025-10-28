class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.10.5"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.10.5/cct-darwin-arm64"
      sha256 "4e53a97fa9aa486b37668370a0a27f79f1986c5c666710e2f3b85ce6bad3e57b"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.10.5/cct-darwin-amd64"
      sha256 "f034c3c1ed5c10b73aab62eaf92bbb0036a24850d75af41c808ba0628a7f941f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.10.2/cct-linux-arm64"
      sha256 "8bafd039270d3fd00b4c161039de9568dec2a612d9684bc8fe307fb9ba992f41"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.10.5/cct-linux-amd64"
      sha256 "eda581afe51eafa6f0ba45cc9c4c3cc28e638b361bb28950e05d1a6a555cdc70"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
