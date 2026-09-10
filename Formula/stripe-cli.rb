class StripeCli < Formula
  desc "Automic Vault build of Stripe CLI"
  homepage "https://github.com/automic-vault/stripe-cli"
  url "https://github.com/automic-vault/stripe-cli/releases/download/v1.50.11/cli-1.50.11.tgz"
  sha256 "ab8446e4f47229ce9d6d50c82871c3e8f8af17fac06fafacb599b9c5dc3712f9"
  license "MIT"

  def install
    bin.install "stripe"
  end

  test do
    assert_match "Stripe CLI", shell_output("#{bin}/stripe --help")
  end
end
