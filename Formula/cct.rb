class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.2.20"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.20/cct-darwin-arm64"
      sha256 "e2b64442dec40941b6c71a6bd7f6c73140f6f9e0f987c985a931300146610bdd"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.20/cct-darwin-amd64"
      sha256 "52eff854afeee0ea1c1a2c53885f55bd6148874d730edae975900393abfe17f8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.20/cct-linux-arm64"
      sha256 "5b438ffc61ac60078404fdca8e374e6de41d26ce02b5425ea00b3c9e823dacc8"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.20/cct-linux-amd64"
      sha256 "1862ec854992eb0ca96958c723d196c5667c25e9c3549f946d4ad02befeb348e"
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
