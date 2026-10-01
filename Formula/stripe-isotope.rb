class StripeIsotope < Formula
  desc "Automic Vault build of Stripe CLI"
  homepage "https://github.com/automic-vault/stripe-cli"
  url "https://github.com/automic-vault/stripe-cli/releases/download/v1.53.0/cli-1.53.0.tgz"
  sha256 "83f2b48ea24d6b5471cb5ce004b52c48e42bf63b08d52cd73be6e131be44d2d7"
  license "MIT"
  conflicts_with "stripe-cli", because: "both install `stripe`"

  def install
    bin.install "stripe"
  end

  test do
    assert_match "Stripe CLI", shell_output("#{bin}/stripe --help")
  end
end
