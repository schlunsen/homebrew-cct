class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.5.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.7/cct-darwin-arm64"
      sha256 "89b7ecc984638a5c054dee42731fa4b70096adbff80389e9492c59b054daa993"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.7/cct-darwin-amd64"
      sha256 "611146cd3b543078ae536ddb3a5c33ecbe8d31711fcb6324ecccf4c71c4d0ce5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.4.4/cct-linux-arm64"
      sha256 "e67019a16f30ffc9caa2fd2967ae34a273f79b4312ddcc6b891290daa647cef3"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.7/cct-linux-amd64"
      sha256 "942da147616e82a681906f4d38d19aac10c662f891afed0796076b584333dc98"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
