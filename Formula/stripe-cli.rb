class StripeCli < Formula
  desc "Automic Vault build of Stripe CLI"
  homepage "https://github.com/automic-vault/stripe-cli"
  url "https://github.com/automic-vault/stripe-cli/releases/download/v1.50.3/cli-1.50.3.tgz"
  sha256 "06f707735d735572e3f481f12cd16725f042adfb7855dd8038b9a2ad65634284"
  license "MIT"
  conflicts_with "stripe", because: "both install `stripe`"

  def install
    bin.install "bin/stripe"
  end

  test do
    assert_match "Stripe CLI", shell_output("#{bin}/stripe --help")
  end
end
