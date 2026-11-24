class StripeIsotope < Formula
  desc "Automic Vault build of Stripe CLI"
  homepage "https://github.com/automic-vault/stripe-cli"
  url "https://github.com/automic-vault/stripe-cli/releases/download/v1.55.15/cli-1.55.15.tgz"
  sha256 "e5d794a1764d1348276a1b88958b9bb5aebbc3075a37e83b49176f449d748f4a"
  license "MIT"
  conflicts_with "stripe-cli", because: "both install `stripe`"

  def install
    bin.install "stripe"
  end

  test do
    assert_match "Stripe CLI", shell_output("#{bin}/stripe --help")
  end
end
