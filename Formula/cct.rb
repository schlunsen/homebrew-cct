class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.2.3"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.3/cct-darwin-arm64"
      sha256 "097dc8c85c34dc99b745b3d4c886959f9e1c941cc4c6715c2f75afb18e3b6cce"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.3/cct-darwin-amd64"
      sha256 "98668d0359eece74f1ca3423cfcef76aa5d85242c9dbdd6e099fb4e7d5a51bb7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.3/cct-linux-arm64"
      sha256 "1d68981a41e1ae67c50c94ec4c669dbc4a7e41ed491a6a6145fb0590fb08cac0"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.3/cct-linux-amd64"
      sha256 "ac42c31de4a21fcfb112c71b427421a9626864388cd41f73f50afc816a120186"
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
