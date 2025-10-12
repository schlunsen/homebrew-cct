class Cct < Formula
  desc "High-performance CLI tool for Claude Code component templates and analytics"
  homepage "https://github.com/schlunsen/claude-templates-go"
  version "0.0.5"

  # This is a precompiled binary, no build tools required
  uses_from_macos "unzip" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.0.5/cct-darwin-arm64"
      sha256 "c1b09e051776936269b3e99a530de9a93176a531b550587cc4b40cfe112cbe18"
    else
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.0.5/cct-darwin-amd64"
      sha256 "138668373dd95f56fa9b43630c4adbb7343b19814a15762d96c0f31c896f8c3f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.0.5/cct-linux-arm64"
      sha256 "678b2184f306202dd58ac8203f3b261980772fab976bc9bae446df1909fa2781"
    else
      url "https://github.com/schlunsen/claude-templates-go/releases/download/v0.0.5/cct-linux-amd64"
      sha256 "9b6fb13de4267d1f9ebad3b82553475f799b83ea911006a808903389f97cb193"
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
