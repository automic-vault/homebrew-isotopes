class GhCli < Formula
  desc "Automic Vault build of GitHub CLI"
  homepage "https://github.com/automic-vault/gh-cli"
  url "https://github.com/automic-vault/gh-cli/releases/download/v2.96.0/cli-2.96.0.tgz"
  sha256 "8ada07199b5807eb51b9eae123c497285fa4409f91d918d6d1bae271b0932fb5"
  license "MIT"
  conflicts_with "gh", because: "both install `gh`"

  def install
    bin.install "gh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gh --version")
  end
end
