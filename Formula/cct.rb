class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.5.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.0/cct-darwin-arm64"
      sha256 "1d721799c29be0b585038a82817258743e16dbb85ab77f2994e61a9a93f47e85"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.0/cct-darwin-amd64"
      sha256 "b3671e795e64cf0e981acc0c00e281c81a25131140b69ae62813e7cf827a84e8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.4.4/cct-linux-arm64"
      sha256 "e67019a16f30ffc9caa2fd2967ae34a273f79b4312ddcc6b891290daa647cef3"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.0/cct-linux-amd64"
      sha256 "a0094074140cbd3b5a4dc6a076a7d4189d70dd2bf46c04ec733bada30f5fe310"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
