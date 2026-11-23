class OpenhueCliIsotope < Formula
  desc "Automic Vault build of OpenHue CLI"
  homepage "https://github.com/automic-vault/openhue-cli"
  url "https://github.com/automic-vault/openhue-cli/releases/download/0.26/cli-0.26.tgz"
  sha256 "fda086cf05b5af41e74f3f100695eb265bc16085a693f15134d1a04ab7bd79d6"
  license "Apache-2.0"
  def install
    bin.install "openhue"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/openhue version")
  end
end
