class UaaCliIsotope < Formula
  desc "Automic Vault build of UAA CLI"
  homepage "https://github.com/automic-vault/uaa-cli"
  url "https://github.com/automic-vault/uaa-cli/releases/download/v0.23.0/cli-0.23.0.tgz"
  sha256 "03a65220324695f7887ad368a56fad186b285d5550915258366f536bcf23603d"
  license "Apache-2.0"
  def install
    bin.install "uaa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/uaa version")
  end
end
