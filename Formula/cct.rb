class Cct < Formula
  desc "Claude Control Terminal - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/claude-control-terminal"
  version "0.5.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.8/cct-darwin-arm64"
      sha256 "7699c751371a7a277f6be9604957f43808f1acffe698b38c39aa2b025f32f55b"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.8/cct-darwin-amd64"
      sha256 "a8ceccd6454fe588a595e2821f6888ab40df8c42102db2337918558297e907f3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.4.4/cct-linux-arm64"
      sha256 "e67019a16f30ffc9caa2fd2967ae34a273f79b4312ddcc6b891290daa647cef3"
    else
      url "https://github.com/schlunsen/claude-control-terminal/releases/download/v0.5.8/cct-linux-amd64"
      sha256 "b3cfe7455ccbd9d669ffb89e61dfd6722ec13f4b073e7451eb0fb33334f2b302"
    end
  end

  def install
    bin.install Dir["cct-*"].first => "cct"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cct --version 2>&1", 0)
  end
end
