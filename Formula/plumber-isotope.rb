class PlumberIsotope < Formula
  desc "Automic Vault build of Plumber"
  homepage "https://github.com/automic-vault/plumber"
  url "https://github.com/automic-vault/plumber/releases/download/v2.9.0/cli-2.9.0.tgz"
  sha256 "ebe647625d8674cca37b1a833fad875132761f6e7a018236459aa8555a3c7bcb"
  license "MIT"
  def install
    bin.install "plumber"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/plumber --version")
  end
end
