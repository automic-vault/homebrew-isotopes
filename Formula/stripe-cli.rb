class StripeCli < Formula
  desc "Automic Vault build of Stripe CLI"
  homepage "https://github.com/automic-vault/stripe-cli"
  url "https://github.com/automic-vault/stripe-cli/releases/download/v1.44.1/cli-1.44.1.tgz"
  sha256 "c953fd749b994b4f82354b4e6e4ec3d2ac7d18b7d39d1b44786d8924378d7ea8"
  license "MIT"
  conflicts_with "stripe", because: "both install `stripe`"

  def install
    bin.install "stripe"
  end

  test do
    assert_match "Stripe CLI", shell_output("#{bin}/stripe --help")
  end
end
