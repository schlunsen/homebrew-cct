class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.3.4"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.3.4/cct-darwin-arm64"
      sha256 "d422204b9fc61b660e2d92af73af81d8cd08c0c47c4321ae48961330b224bbba"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.3.4/cct-darwin-amd64"
      sha256 "780d594f12c4dea49540ded2221eceb30950c46ed0e7179f370e24da53e4cbbe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.3.3/cct-linux-arm64"
      sha256 "5b438ffc61ac60078404fdca8e374e6de41d26ce02b5425ea00b3c9e823dacc8"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.3.4/cct-linux-amd64"
      sha256 "c45a9f601bce643b8fed294109251b97c3921e013999899fc50544ba691dbeea"
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
