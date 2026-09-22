class StripeIsotope < Formula
  desc "Automic Vault build of Stripe CLI"
  homepage "https://github.com/automic-vault/stripe-cli"
  url "https://github.com/automic-vault/stripe-cli/releases/download/v1.51.1/cli-1.51.1.tgz"
  sha256 "3ea45afdb64f0f94dc5c6cc14bd748d7f3bb7fc64189e3e12ad7ca6849897c46"
  license "MIT"
  conflicts_with "stripe-cli", because: "both install `stripe`"

  def install
    bin.install "stripe"
  end

  test do
    assert_match "Stripe CLI", shell_output("#{bin}/stripe --help")
  end
end
