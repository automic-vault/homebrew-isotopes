class OpentofuIsotope < Formula
  desc "Automic Vault build of OpenTofu"
  homepage "https://github.com/automic-vault/opentofu"
  url "https://github.com/automic-vault/opentofu/releases/download/v1.13.2/cli-1.13.2.tgz"
  sha256 "5c9a2c75880ce08e3765535365eef882a9917a3929d58056df2277749eb56800"
  license "MPL-2.0"
  conflicts_with "opentofu", because: "both install `tofu`"

  def install
    bin.install "tofu"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tofu version")
  end
end
