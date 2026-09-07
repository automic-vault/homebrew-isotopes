class GhCli < Formula
  desc "Automic Vault build of GitHub CLI"
  homepage "https://github.com/automic-vault/gh-cli"
  url "https://github.com/automic-vault/gh-cli/releases/download/v2.100.0-1/cli-2.100.0-1.tgz"
  sha256 "12833bd4c5b9857d6440b7dfcfa175eb92bb9ecc26e1e6994f063a8887cc5d38"
  license "MIT"
  conflicts_with "gh", because: "both install `gh`"

  def install
    bin.install "gh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gh --version")
  end
end
