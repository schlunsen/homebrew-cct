class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.3.5"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.3.5/cct-darwin-arm64"
      sha256 "cfef1993ca8054527057b1e0a7963605b4fb30d6c879d2142b20882a50edbc20"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.3.5/cct-darwin-amd64"
      sha256 "bc1a97f143f1c0c179a66342db590452bdfb24b52965f8e204e051a80f9c682f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.3.3/cct-linux-arm64"
      sha256 "5b438ffc61ac60078404fdca8e374e6de41d26ce02b5425ea00b3c9e823dacc8"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.3.5/cct-linux-amd64"
      sha256 "64eb6fef9c9ea9cf38ff0ccd5f99bac7b177823e0e9f65442fb18937dab73352"
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
