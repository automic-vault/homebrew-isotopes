class StripeIsotope < Formula
  desc "Automic Vault build of Stripe CLI"
  homepage "https://github.com/automic-vault/stripe-cli"
  url "https://github.com/automic-vault/stripe-cli/releases/download/v1.55.7/cli-1.55.7.tgz"
  sha256 "fb23e0149839373b72f4056cb005e4f00d056f8c8ef13c7d3099e40bb599d910"
  license "MIT"
  conflicts_with "stripe-cli", because: "both install `stripe`"

  def install
    bin.install "stripe"
  end

  test do
    assert_match "Stripe CLI", shell_output("#{bin}/stripe --help")
  end
end
