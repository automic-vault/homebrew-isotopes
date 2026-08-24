class Goat < Formula
  desc "Automic Vault build of goat"
  homepage "https://github.com/automic-vault/goat"
  url "https://github.com/automic-vault/goat/releases/download/v0.2.3/cli-0.2.3.tgz"
  sha256 "081f9e2ee04b9640bf48549e8edc37a7469e34b3afb0c6e3c287a2334e99b8cf"
  license "Apache-2.0"
  conflicts_with "goat", because: "both install `goat`"

  def install
    bin.install "goat"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/goat --version")
  end
end
