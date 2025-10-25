class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.7.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.7.0/cct-darwin-arm64"
      sha256 "151764bfbd56cc12dc6f4ba4e1c7108abb98aa1d1c400f18ab07cd9831d0c5b8"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.7.0/cct-darwin-amd64"
      sha256 "ecd2b5eff9820afedca2539054ba6591cf8e2e32889b6dce26ccaa5465445bcd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.7.0/cct-linux-arm64"
      sha256 "97b36a22dfdad83b32a416166d50afa5bd3fdc924e62ad67ec3a43f204dfc3a7"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.7.0/cct-linux-amd64"
      sha256 "768876771a5eee3dfc2ccea27d9bc2ebdb26bf7259f174c9abdc8135de7d559f"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
