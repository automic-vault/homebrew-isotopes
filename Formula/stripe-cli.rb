class StripeCli < Formula
  desc "Automic Vault build of Stripe CLI"
  homepage "https://github.com/automic-vault/stripe-cli"
  url "https://github.com/automic-vault/stripe-cli/releases/download/v1.50.4/cli-1.50.4.tgz"
  sha256 "b91a431a4fa6c252c83b90d2991a6d9b9e23c2a15d58e786b641962e344ea998"
  license "MIT"
  conflicts_with "stripe", because: "both install `stripe`"

  def install
    bin.install "stripe"
  end

  test do
    assert_match "Stripe CLI", shell_output("#{bin}/stripe --help")
  end
end
