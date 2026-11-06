class GoatIsotope < Formula
  desc "Automic Vault build of goat"
  homepage "https://github.com/automic-vault/goat"
  url "https://github.com/automic-vault/goat/releases/download/v0.2.9/cli-0.2.9.tgz"
  sha256 "b72fa4f602b8f2f42f74f116be03bff80f43bab07b48f5e696548db835029420"
  license "Apache-2.0"
  conflicts_with "goat", because: "both install `goat`"

  def install
    bin.install "goat"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/goat --version")
  end
end
