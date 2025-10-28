class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.10.7"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.10.7/cct-darwin-arm64"
      sha256 "313cca3e4ad155ef3ef34fe6ed26cff154d8e882b54055a61f180404589ab28d"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.10.7/cct-darwin-amd64"
      sha256 "2924212f9865f87ae0b8a2f3a39db3b7fa84333b02c96981f57e7af7a5fe5b9c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.10.2/cct-linux-arm64"
      sha256 "8bafd039270d3fd00b4c161039de9568dec2a612d9684bc8fe307fb9ba992f41"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.10.7/cct-linux-amd64"
      sha256 "23762c93d8044403f683388076a8b7643bf942ed9c0ba97fa6eb611589724b1c"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
