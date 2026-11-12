class GhCli < Formula
  desc "Automic Vault build of GitHub CLI"
  homepage "https://github.com/automic-vault/gh-cli"
  url "https://github.com/automic-vault/gh-cli/releases/download/v2.104.0/cli-2.104.0.tgz"
  sha256 "6287f7365c858877f800ef24d158e44ef675a47d3d4e18eb8f15ad3d4ff7e524"
  license "MIT"
  conflicts_with "gh", because: "both install `gh`"

  def install
    bin.install "gh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gh --version")
  end
end
