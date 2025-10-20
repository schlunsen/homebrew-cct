class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.5.11"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.11/cct-darwin-arm64"
      sha256 "416454ec69f912f3559fc311078c3b7b53b82511cb399fc6faa9021e272f4177"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.11/cct-darwin-amd64"
      sha256 "6bb1dc5f6c96e00dce7d57a2961d764feeadc82dc75b8bf81bd7edcca6da8df4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.4.4/cct-linux-arm64"
      sha256 "e67019a16f30ffc9caa2fd2967ae34a273f79b4312ddcc6b891290daa647cef3"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.11/cct-linux-amd64"
      sha256 "0d20ab08b45be49ee3bf7b2a07925eeb6498815cdef79e275226d97ec120e558"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
