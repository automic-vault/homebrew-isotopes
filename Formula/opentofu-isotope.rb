class OpentofuIsotope < Formula
  desc "Automic Vault build of OpenTofu"
  homepage "https://github.com/automic-vault/opentofu"
  url "https://github.com/automic-vault/opentofu/releases/download/v1.13.1/cli-1.13.1.tgz"
  sha256 "2f0d473346e228b0211377ac5c318fd5507a28f20544d3f3b7700700fcc14660"
  license "MPL-2.0"
  conflicts_with "opentofu", because: "both install `tofu`"

  def install
    bin.install "tofu"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tofu version")
  end
end
