class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.2.2"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.2/cct-darwin-arm64"
      sha256 "5e9b0f475824a09e6936f02d6bf414b493d4d096ef4301d06fea001aa09c4a4d"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.2/cct-darwin-amd64"
      sha256 "eef0aac5fd3b22ef8749f9e6ac5b44d64321ace322e099b15ec0e6749ab00847"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.2/cct-linux-arm64"
      sha256 "6e5421a4eb38a92171ba29a74c25f74ce4e9e93854555bc2c496d229074554b8"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.2/cct-linux-amd64"
      sha256 "913f4ac02f8e5441baeb1b964628e1ecb3d3fa1ffd7389cb86aaf28d23f5d093"
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
