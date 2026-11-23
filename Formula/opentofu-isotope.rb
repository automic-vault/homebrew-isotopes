class OpentofuIsotope < Formula
  desc "Automic Vault build of OpenTofu"
  homepage "https://github.com/automic-vault/opentofu"
  url "https://github.com/automic-vault/opentofu/releases/download/v1.13.10/cli-1.13.10.tgz"
  sha256 "49b3c04991423080b35733840f7ffa2db165947588fb21e8f25a2399828ac6d5"
  license "MPL-2.0"
  conflicts_with "opentofu", because: "both install `tofu`"

  def install
    bin.install "tofu"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tofu version")
  end
end
