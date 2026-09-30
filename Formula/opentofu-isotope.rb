class OpentofuIsotope < Formula
  desc "Automic Vault build of OpenTofu"
  homepage "https://github.com/automic-vault/opentofu"
  url "https://github.com/automic-vault/opentofu/releases/download/v1.13.0/cli-1.13.0.tgz"
  sha256 "ccfac2dd7ab5ddb061b178d38974583b548914bd6149ddd06cd495b789c4576a"
  license "MPL-2.0"
  conflicts_with "opentofu", because: "both install `tofu`"

  def install
    bin.install "tofu"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tofu version")
  end
end
