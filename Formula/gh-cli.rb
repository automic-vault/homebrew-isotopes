class GhCli < Formula
  desc "Automic Vault build of GitHub CLI"
  homepage "https://github.com/automic-vault/gh-cli"
  url "https://github.com/automic-vault/gh-cli/releases/download/v2.103.0/cli-2.103.0.tgz"
  sha256 "0336c78dafbc59045a23f062449eab35ae2ba1a4da14612e556be4dc108a4236"
  license "MIT"
  conflicts_with "gh", because: "both install `gh`"

  def install
    bin.install "bin/gh"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/gh --version")
  end
end
