class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.10.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.10.2/cct-darwin-arm64"
      sha256 "2426e1ff3ca10d6e0211d624b6f8083226ffb43b65f514b0b53be28a54eb1b20"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.10.2/cct-darwin-amd64"
      sha256 "f94af855fee86551b39e4b67e8fccc12a6f03ac12a7cd8063c43abd30623c656"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.10.2/cct-linux-arm64"
      sha256 "8bafd039270d3fd00b4c161039de9568dec2a612d9684bc8fe307fb9ba992f41"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.10.2/cct-linux-amd64"
      sha256 "23953d3e79b9a962f93059b3d8f00584709475cc2840a617582cd360781b465a"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
