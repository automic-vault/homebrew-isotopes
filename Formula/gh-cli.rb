class GhCli < Formula
  desc "Automic Vault build of GitHub CLI"
  homepage "https://github.com/automic-vault/gh-cli"
  url "https://github.com/automic-vault/gh-cli/releases/download/v2.94.0/cli-2.94.0.tgz"
  sha256 "2d9fb4cf2e5155168cf014c01232f2ec388f39b45790632b4b17a696fccf8d20"
  license "MIT"
  conflicts_with "gh", because: "both install `gh`"

  def install
    bin.install "bin/gh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gh --version")
  end
end
