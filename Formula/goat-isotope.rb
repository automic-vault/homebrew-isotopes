class GoatIsotope < Formula
  desc "Automic Vault build of goat"
  homepage "https://github.com/automic-vault/goat"
  url "https://github.com/automic-vault/goat/releases/download/v0.2.7/cli-0.2.7.tgz"
  sha256 "2b724db0115c250c8deab8263d64aa7bccc7d621848223660ce42f3c5b349b7a"
  license "Apache-2.0"
  conflicts_with "goat", because: "both install `goat`"

  def install
    bin.install "goat"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/goat --version")
  end
end
