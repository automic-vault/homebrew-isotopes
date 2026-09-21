class RailwayIsotope < Formula
  desc "Automic Vault build of Railway CLI"
  homepage "https://github.com/automic-vault/railway-cli"
  url "https://github.com/automic-vault/railway-cli/releases/download/v5.59.0/cli-5.59.0.tgz"
  sha256 "a2aa603caaa3a971af67cc73388784f06f08b5862637e9b7eba01ec6e5c8a77d"
  license "MIT"
  conflicts_with "railway", because: "both install `railway`"

  def install
    bin.install "railway"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/railway --version")
  end
end
