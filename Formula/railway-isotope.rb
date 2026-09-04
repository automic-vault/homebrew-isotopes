class RailwayIsotope < Formula
  desc "Automic Vault build of Railway CLI"
  homepage "https://github.com/automic-vault/railway-cli"
  url "https://github.com/automic-vault/railway-cli/releases/download/v5.49.1/cli-5.49.1.tgz"
  sha256 "28ab4fbbbd6d6bd7c033449590a3b9ecfa89d334fb46e735caca36a8d2c34cdf"
  license "MIT"
  conflicts_with "railway", because: "both install `railway`"

  def install
    bin.install "railway"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/railway --version")
  end
end
