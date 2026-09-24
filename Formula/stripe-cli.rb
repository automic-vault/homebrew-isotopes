class StripeCli < Formula
  desc "Automic Vault build of Stripe CLI"
  homepage "https://github.com/automic-vault/stripe-cli"
  url "https://github.com/automic-vault/stripe-cli/releases/download/v1.52.0/cli-1.52.0.tgz"
  sha256 "975b9a4d208a4e04d5ab2d74ba91a694d8605f02bff99548257ff20d8bb33190"
  license "MIT"

  def install
    bin.install "stripe"
  end

  test do
    assert_match "Stripe CLI", shell_output("#{bin}/stripe --help")
  end
end
