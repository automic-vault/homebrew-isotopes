class GhCli < Formula
  desc "Automic Vault build of GitHub CLI"
  homepage "https://github.com/automic-vault/gh-cli"
  url "https://github.com/automic-vault/gh-cli/releases/download/v2.98.0-1/cli-2.98.0-1.tgz"
  sha256 "e74eb7dd3296e73e26c7f0b478dbe40d5d41694de04a4ed161ad83921832bed1"
  license "MIT"
  conflicts_with "gh", because: "both install `gh`"

  def install
    bin.install "gh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gh --version")
  end
end
