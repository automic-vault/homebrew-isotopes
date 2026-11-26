class GoatIsotope < Formula
  desc "Automic Vault build of goat"
  homepage "https://github.com/automic-vault/goat"
  url "https://github.com/automic-vault/goat/releases/download/v0.2.10/cli-0.2.10.tgz"
  sha256 "313e1d7b105f58ad47d854437f967d7df06667e84a136d27fc5fa0d0e73bc996"
  license "Apache-2.0"
  conflicts_with "goat", because: "both install `goat`"

  def install
    bin.install "goat"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/goat --version")
  end
end
