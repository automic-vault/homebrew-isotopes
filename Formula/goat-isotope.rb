class GoatIsotope < Formula
  desc "Automic Vault build of goat"
  homepage "https://github.com/automic-vault/goat"
  url "https://github.com/automic-vault/goat/releases/download/v0.2.8/cli-0.2.8.tgz"
  sha256 "a6ee660d7926cdf44e17dd6253a327850562228eaf80906872177d81516f70ab"
  license "Apache-2.0"
  conflicts_with "goat", because: "both install `goat`"

  def install
    bin.install "goat"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/goat --version")
  end
end
