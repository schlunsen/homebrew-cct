class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.3.0"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.3.0/cct-darwin-arm64"
      sha256 "b6f2593cfa1489e7bac51ef7b3b5df0905f360cd1d9a1155ff07ffaa758f9865"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.3.0/cct-darwin-amd64"
      sha256 "2de86ffe60d514939e881d26930daddddaf39929f0b4b582ee2a2f1299b45cab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.3.0/cct-linux-arm64"
      sha256 "5b438ffc61ac60078404fdca8e374e6de41d26ce02b5425ea00b3c9e823dacc8"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.3.0/cct-linux-amd64"
      sha256 "b755b07e4f0334b759f89e40f7e10f76bd512f45ddb68c5ab37f2272a9dd61a1"
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
