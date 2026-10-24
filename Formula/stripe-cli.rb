class StripeCli < Formula
  desc "Automic Vault build of Stripe CLI"
  homepage "https://github.com/automic-vault/stripe-cli"
  url "https://github.com/automic-vault/stripe-cli/releases/download/v1.55.1/cli-1.55.1.tgz"
  sha256 "cdd895c20d8a095b45880441f747075af63491c5be111bfc5fdd4c5f8f44a7e0"
  license "MIT"

  def install
    bin.install "bin/stripe"
  end

  test do
    assert_match "Stripe CLI", shell_output("#{bin}/stripe --help")
  end
end
