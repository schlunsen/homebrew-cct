class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.10.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.10.8/cct-darwin-arm64"
      sha256 "ef6a58633d530151f09ed07882d3f67793d488d1be408a1efeeca978b548b0f4"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.10.8/cct-darwin-amd64"
      sha256 "4c6e95a75adb1d9811f43e578e6eb2dc5bf4754a03c62931d0e3159255f207d7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.10.2/cct-linux-arm64"
      sha256 "8bafd039270d3fd00b4c161039de9568dec2a612d9684bc8fe307fb9ba992f41"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.10.8/cct-linux-amd64"
      sha256 "269bb0f383f59a7e31916276d9c95b30afc32a324c7969b8d7c1e98bbd997a1a"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
