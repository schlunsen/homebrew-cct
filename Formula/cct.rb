class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.2.6"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.6/cct-darwin-arm64"
      sha256 "736176666d359211c7605df791dc5601f655127be95e216342619f37c1e123e9"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.6/cct-darwin-amd64"
      sha256 "b49e02567bd2d11a958394235e06315f96673403cbd73765910fe0209e96aec0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.6/cct-linux-arm64"
      sha256 "fa8277ee87515c21a342def04ae8fc0df940032bdd6c7a94635d89d3cd143ab2"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.2.6/cct-linux-amd64"
      sha256 "989f4d05171d044f58407b0c62f495ceac294572df2793f146537bf93fa8f38b"
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
