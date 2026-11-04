class StripeCli < Formula
  desc "Automic Vault build of Stripe CLI"
  homepage "https://github.com/automic-vault/stripe-cli"
  url "https://github.com/automic-vault/stripe-cli/releases/download/v1.55.8/cli-1.55.8.tgz"
  sha256 "f355a32be8d52bdd8e8f44b1671de7f0318de913ac8445a1ee36c6c295272bba"
  license "MIT"

  def install
    bin.install "stripe"
  end

  test do
    assert_match "Stripe CLI", shell_output("#{bin}/stripe --help")
  end
end
