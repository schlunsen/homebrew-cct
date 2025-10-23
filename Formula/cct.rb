class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.6.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.6.0/cct-darwin-arm64"
      sha256 "744b51911c23d613e44409a19e871ac4a6854b2246a123790d2ea2ff0ed992d0"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.6.0/cct-darwin-amd64"
      sha256 "ded25abaf9c5abc863a23a7a20ab695d3b55db8800a2ebcdd18e3551744a67ff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.6.0/cct-linux-arm64"
      sha256 "cad41f9d2ff42afe725aa9f6e6716e161fe9c132dd994914dfb29f0ad64e1157"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.6.0/cct-linux-amd64"
      sha256 "4392988025e9031fc9ee101421da494230de897a6adfa283db94365a7f9c081d"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
