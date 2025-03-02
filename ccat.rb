class Ccat < Formula
  desc "CLI tool to clone and concatenate code repositories for AI analysis"
  homepage "https://github.com/unclecode/ccat"
  url "https://github.com/unclecode/ccat/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "REPLACE_WITH_ACTUAL_SHA_AFTER_CREATING_RELEASE"
  license "MIT"

  depends_on "git"
  depends_on "tree"
  depends_on "grep"
  depends_on "file"

  def install
    bin.install "ccat.sh" => "ccat"
  end

  test do
    system "#{bin}/ccat", "--version"
  end
end