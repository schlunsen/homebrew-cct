class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.4.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.4.2/cct-darwin-arm64"
      sha256 "32ed442f53bd5037969c5a6b1de9eeaa82d3a7d298c0832bb6f8ec7faf7dfe13"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.4.2/cct-darwin-amd64"
      sha256 "51d4aa33ef2aa60af4da100a8a8ede9e323d3bbd759fc828a5c025b6d75fbdd6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.4.2/cct-linux-arm64"
      sha256 "de6e4fd17de98ae0486e85612eb59e3c4fdd87ef78fc55be2c08be6279d2ec8e"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.4.2/cct-linux-amd64"
      sha256 "b20a6beb32c89652748680be278340d77cdcd50666709796ff914fe233b348df"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
