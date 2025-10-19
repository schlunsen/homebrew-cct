class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.5.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.0/cct-darwin-arm64"
      sha256 "bb34482e8834814523662347ff56bba223c047692d6e03a4edfa546c80ad3be6"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.0/cct-darwin-amd64"
      sha256 "5ad54aa643591190cfef32ccd6692798f2040181f9c0ca8d6a1aeaa654e759ad"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.4.4/cct-linux-arm64"
      sha256 "e67019a16f30ffc9caa2fd2967ae34a273f79b4312ddcc6b891290daa647cef3"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.0/cct-linux-amd64"
      sha256 "c1d7ac9e39b810054020b463c4908dfc806f6ce70c0b87f1c967d9c77960cb6c"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
