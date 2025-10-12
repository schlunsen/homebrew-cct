class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.2.1"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.1/cct-darwin-arm64"
      sha256 "299e762172ff65910af7843f655d0b13bdc75236648bdc2bdc6736fc58db9486"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.1/cct-darwin-amd64"
      sha256 "c50c1f86ac537d7aa08ea7eec36ad8ca17a7570f57a0a5c6c9f8e206243867db"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.1/cct-linux-arm64"
      sha256 "ca98b7687342679d1c0049f98fa368637a82d1bdc550fb4a64671d9221e2ddf3"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.1/cct-linux-amd64"
      sha256 "db916e9bbc570d66a258833f2ac47b40b1f603e0793a34a6015ed396dd2a07d1"
    end
  end

  def install
    # The downloaded file is a precompiled binary
    downloaded_file = Dir["cct-*"].first
    bin.install downloaded_file => "cct"
    chmod 0755, bin/"cct"
  end

  test do
    system "#{bin}/cct", "--help"
  end
end
