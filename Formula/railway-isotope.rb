class RailwayIsotope < Formula
  desc "Automic Vault build of Railway CLI"
  homepage "https://github.com/automic-vault/railway-cli"
  url "https://github.com/automic-vault/railway-cli/releases/download/v5.64.1/cli-5.64.1.tgz"
  sha256 "bac2632abf5d49ce3ae6600aa1d28dc9f5d9353951586ba3a2b67627e6a7a0f5"
  license "MIT"
  conflicts_with "railway", because: "both install `railway`"

  def install
    bin.install "railway"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/railway --version")
  end
end
