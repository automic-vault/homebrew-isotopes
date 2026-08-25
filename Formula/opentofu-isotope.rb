class OpentofuIsotope < Formula
  desc "Automic Vault build of OpenTofu"
  homepage "https://github.com/automic-vault/opentofu"
  url "https://github.com/automic-vault/opentofu/releases/download/v1.12.6/cli-1.12.6.tgz"
  sha256 "9ee77f53a4f8952db10ce35dedf05ad9da05ff380f812560db17d8ee2a4f6210"
  license "MPL-2.0"
  conflicts_with "opentofu", because: "both install `tofu`"

  def install
    bin.install "tofu"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tofu version")
  end
end
