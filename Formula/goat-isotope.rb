class GoatIsotope < Formula
  desc "Automic Vault build of goat"
  homepage "https://github.com/automic-vault/goat"
  url "https://github.com/automic-vault/goat/releases/download/v0.2.4/cli-0.2.4.tgz"
  sha256 "5bed9897b83a53b348765c3d6e327e3eac35e15e6ace56a495049fd56f5bf5e6"
  license "Apache-2.0"
  conflicts_with "goat", because: "both install `goat`"

  def install
    bin.install "goat"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/goat --version")
  end
end
