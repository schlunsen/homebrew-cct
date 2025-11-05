class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.13.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.13.2/cct-darwin-arm64"
      sha256 "ab2db80f183c9735a2033150637235d8eedf31fc48e4fb09c91a06a67b8441c8"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.13.2/cct-darwin-amd64"
      sha256 "1e7e1fac40e2538607ba384cf211adbe52a883873d2e52f711fa2c3b27626818"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.10.2/cct-linux-arm64"
      sha256 "8bafd039270d3fd00b4c161039de9568dec2a612d9684bc8fe307fb9ba992f41"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.13.2/cct-linux-amd64"
      sha256 "167f5515cf6c22c8383d82664b21c1dc6c6a4740207210e5475782a001d139ac"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
