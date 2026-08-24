class OpenhueCli < Formula
  desc "Automic Vault build of OpenHue CLI"
  homepage "https://github.com/automic-vault/openhue-cli"
  url "https://github.com/automic-vault/openhue-cli/releases/download/0.24/cli-0.24.tgz"
  sha256 "94e13031a71f5b3536690d8509ad9f418c819663849b9b5da1a8a198c90bbfc6"
  license "Apache-2.0"
  conflicts_with "openhue-cli", because: "both install `openhue`"

  def install
    bin.install "openhue"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/openhue version")
  end
end
