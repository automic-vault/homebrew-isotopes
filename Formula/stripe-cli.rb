class StripeCli < Formula
  desc "Automic Vault build of Stripe CLI"
  homepage "https://github.com/automic-vault/stripe-cli"
  url "https://github.com/automic-vault/stripe-cli/releases/download/v1.55.10/cli-1.55.10.tgz"
  sha256 "00f27dd9c7668a7b8406da3a5d05ce3e56a80295836d21c7e1a030b9ab9454cc"
  license "MIT"

  def install
    bin.install "stripe"
  end

  test do
    assert_match "Stripe CLI", shell_output("#{bin}/stripe --help")
  end
end
