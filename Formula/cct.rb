class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.4.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.4.3/cct-darwin-arm64"
      sha256 "c640f4715d3daaf0fe91a7c137c2dc0c52041c7ab2a6a8c144be1ca4dc1a4e53"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.4.3/cct-darwin-amd64"
      sha256 "ca07eb7f0be2dbc874ceecdf82117f61cff73e5e22f8d0608eeb331666ec299c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.4.3/cct-linux-arm64"
      sha256 "e67019a16f30ffc9caa2fd2967ae34a273f79b4312ddcc6b891290daa647cef3"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.4.3/cct-linux-amd64"
      sha256 "1e59aaedeb0d111c0f19fcc7de1cf2915cb64a141c65e923bb1c21618354c6eb"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
