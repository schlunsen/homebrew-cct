class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.10.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.10.3/cct-darwin-arm64"
      sha256 "71346cf94b76d6cc4c07cca3bd712eb8a838890c8b316362fa656d89e6346fa2"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.10.3/cct-darwin-amd64"
      sha256 "c7e5a4bdb07e6ad926767019b8e49c5831ab7e56deb1539ebd0627ba4a8ad026"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.10.2/cct-linux-arm64"
      sha256 "8bafd039270d3fd00b4c161039de9568dec2a612d9684bc8fe307fb9ba992f41"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.10.3/cct-linux-amd64"
      sha256 "1b326111f7ddb74874f14fe3b5c796ae26db6927660ec72c5bed4272374fc164"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
