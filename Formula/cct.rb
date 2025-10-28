class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.10.4"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.10.4/cct-darwin-arm64"
      sha256 "7eb718443f53b09bfc7da3060512de3215768704b807f7c209535ca5b6e51507"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.10.4/cct-darwin-amd64"
      sha256 "d43dc57a185e88f58c709a534c89da35f39231058f39bc382a35f7c7bce18a29"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.10.2/cct-linux-arm64"
      sha256 "8bafd039270d3fd00b4c161039de9568dec2a612d9684bc8fe307fb9ba992f41"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.10.4/cct-linux-amd64"
      sha256 "93001a57384a923ef591c56ee076288f9e6c269dc2337462cc1d552947951c7a"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
