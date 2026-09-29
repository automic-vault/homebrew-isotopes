class StripeCli < Formula
  desc "Automic Vault build of Stripe CLI"
  homepage "https://github.com/automic-vault/stripe-cli"
  url "https://github.com/automic-vault/stripe-cli/releases/download/v1.52.1/cli-1.52.1.tgz"
  sha256 "6f4274d52ea7d4974154306ad7cd291422f166ce363cbe4f0f73a7e0e5914fa7"
  license "MIT"

  def install
    bin.install "stripe"
  end

  test do
    assert_match "Stripe CLI", shell_output("#{bin}/stripe --help")
  end
end
