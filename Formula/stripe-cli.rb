class StripeCli < Formula
  desc "Automic Vault build of Stripe CLI"
  homepage "https://github.com/automic-vault/stripe-cli"
  url "https://github.com/automic-vault/stripe-cli/releases/download/v1.50.6-1/cli-1.50.6-1.tgz"
  sha256 "428b7c94c07ebde1cf15ebee55856db5fe4ed86a49c5b3e472f903185531e0cb"
  license "MIT"
  conflicts_with "stripe", because: "both install `stripe`"

  def install
    bin.install "stripe"
  end

  test do
    assert_match "Stripe CLI", shell_output("#{bin}/stripe --help")
  end
end
