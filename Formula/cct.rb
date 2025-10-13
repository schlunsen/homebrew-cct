class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.2.16"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.16/cct-darwin-arm64"
      sha256 "a8d07a815adc39bf3e04dcd18272f7323b5f9257fd9a7782b2affbf55cdcd0db"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.16/cct-darwin-amd64"
      sha256 "06b1b4f46d2cb0d7162eaf49985e7938d9f3c534ce775ca98ab02176cb3bb1a6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.16/cct-linux-arm64"
      sha256 "5b438ffc61ac60078404fdca8e374e6de41d26ce02b5425ea00b3c9e823dacc8"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.16/cct-linux-amd64"
      sha256 "84b33f932d2a6f8b80de76f9b6f70c08f70234c0059270ec1fe257de433c98da"
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
