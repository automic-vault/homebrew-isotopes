class StripeCli < Formula
  desc "Automic Vault build of Stripe CLI"
  homepage "https://github.com/automic-vault/stripe-cli"
  url "https://github.com/automic-vault/stripe-cli/releases/download/v1.45.1/cli-1.45.1.tgz"
  sha256 "893e73c245197ccfdb55f4d3b2719a7dd7d59e648695035642b77e7947e2d5aa"
  license "MIT"
  conflicts_with "stripe", because: "both install `stripe`"

  def install
    bin.install "stripe"
  end

  test do
    assert_match "Stripe CLI", shell_output("#{bin}/stripe --help")
  end
end
