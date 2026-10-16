class StripeIsotope < Formula
  desc "Automic Vault build of Stripe CLI"
  homepage "https://github.com/automic-vault/stripe-cli"
  url "https://github.com/automic-vault/stripe-cli/releases/download/v1.54.0/cli-1.54.0.tgz"
  sha256 "69b9df6085d15d3d97c0a6c6838dd9021bf679e5f06ece919efe471b1447642f"
  license "MIT"
  conflicts_with "stripe-cli", because: "both install `stripe`"

  def install
    bin.install "stripe"
  end

  test do
    assert_match "Stripe CLI", shell_output("#{bin}/stripe --help")
  end
end
