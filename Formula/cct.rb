class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.5.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.6/cct-darwin-arm64"
      sha256 "448f50b5a7b3ee8f6ded522987a5e8d6c86c11ad5059570de7f4b5726f9c4e92"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.6/cct-darwin-amd64"
      sha256 "f1025dd40710cea014b7ae1d99a35f0bc2f883c94abf0aabe9cd2446c14ba712"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.4.4/cct-linux-arm64"
      sha256 "e67019a16f30ffc9caa2fd2967ae34a273f79b4312ddcc6b891290daa647cef3"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.6/cct-linux-amd64"
      sha256 "7dd63488308302690013975697a60b89bcbe97cc69f1727ac6d33bfa1f848ebe"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
