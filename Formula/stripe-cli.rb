class StripeCli < Formula
  desc "Automic Vault build of Stripe CLI"
  homepage "https://github.com/automic-vault/stripe-cli"
  url "https://github.com/automic-vault/stripe-cli/releases/download/v1.44.0/cli-1.44.0.tgz"
  sha256 "b8e9811df2ec2028c0f52271db266c5832834ceb4019ab9a87c369eb74dea35b"
  license "MIT"
  conflicts_with "stripe", because: "both install `stripe`"

  def install
    bin.install "stripe"
  end

  test do
    assert_match "Stripe CLI", shell_output("#{bin}/stripe --help")
  end
end
