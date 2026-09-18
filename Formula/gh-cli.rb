class GhCli < Formula
  desc "Automic Vault build of GitHub CLI"
  homepage "https://github.com/automic-vault/gh-cli"
  url "https://github.com/automic-vault/gh-cli/releases/download/v2.101.0-2/cli-2.101.0-2.tgz"
  sha256 "781538a0c3c4333bae2137dd82e2849516ca9d6c86b0a2c48f11ecd8a20a177e"
  license "MIT"
  conflicts_with "gh", because: "both install `gh`"

  def install
    bin.install "gh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gh --version")
  end
end
