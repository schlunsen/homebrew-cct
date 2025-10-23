class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.5.14"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.14/cct-darwin-arm64"
      sha256 "633c7ef88f36825fa7c6544b91b6ac62227f8957a5877344777862716f3275af"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.14/cct-darwin-amd64"
      sha256 "e0bb44a09c9af7d1e46114000ee0931186783b7f8be771d00ea72460d02eb8dd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.14/cct-linux-arm64"
      sha256 "cad41f9d2ff42afe725aa9f6e6716e161fe9c132dd994914dfb29f0ad64e1157"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.14/cct-linux-amd64"
      sha256 "d91d1008a795acf2c23e7fdfd9a359a96119711fcd2620b3a89645f47e7b6048"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
