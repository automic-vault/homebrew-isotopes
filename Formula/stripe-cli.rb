class StripeCli < Formula
  desc "Automic Vault build of Stripe CLI"
  homepage "https://github.com/automic-vault/stripe-cli"
  url "https://github.com/automic-vault/stripe-cli/releases/download/v1.51.0/cli-1.51.0.tgz"
  sha256 "7d75c7f48e0c6adca0d4c063fd71d75bf4579a36ebdcf8d5ebbb68c978c4e5f5"
  license "MIT"

  def install
    bin.install "stripe"
  end

  test do
    assert_match "Stripe CLI", shell_output("#{bin}/stripe --help")
  end
end
