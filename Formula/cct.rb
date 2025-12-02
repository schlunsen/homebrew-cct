class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.16.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.16.0/cct-darwin-arm64"
      sha256 "2c08a282be6e9851089064a5476f5a8e76765f0a3d241f41c5bf65e2d465db9e"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.16.0/cct-darwin-amd64"
      sha256 "af2d244fa25ef522f73dfa55701553699effd360c3c3584e69491121cc6fd20c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.10.2/cct-linux-arm64"
      sha256 "8bafd039270d3fd00b4c161039de9568dec2a612d9684bc8fe307fb9ba992f41"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.16.0/cct-linux-amd64"
      sha256 "4d0259c2ccb58ddf988072f99423c7b39ff22f4568547036543b0134ff96ce92"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
