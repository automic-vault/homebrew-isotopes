class RailwayCli < Formula
  desc "Automic Vault build of Railway CLI"
  homepage "https://github.com/automic-vault/railway-cli"
  url "https://github.com/automic-vault/railway-cli/releases/download/v5.43.2/cli-5.43.2.tgz"
  sha256 "cc17c953839082f3afac6baa17ccf27691b1d8f768e3a504debf77d3e30a1f61"
  license "MIT"
  conflicts_with "railway", because: "both install `railway`"

  def install
    bin.install "railway"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/railway --version")
  end
end
