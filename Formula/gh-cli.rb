class GhCli < Formula
  desc "Automic Vault build of GitHub CLI"
  homepage "https://github.com/automic-vault/gh-cli"
  url "https://github.com/automic-vault/gh-cli/releases/download/v2.100.0-2/cli-2.100.0-2.tgz"
  sha256 "5fff9e6021e89c07823e13cefae5df4a2ffcc10583ec30f52bf540bb250d8555"
  license "MIT"
  conflicts_with "gh", because: "both install `gh`"

  def install
    bin.install "gh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gh --version")
  end
end
