class OrdercliIsotope < Formula
  desc "Automic Vault build of ordercli"
  homepage "https://github.com/automic-vault/ordercli"
  url "https://github.com/automic-vault/ordercli/releases/download/v0.2.1/cli-0.2.1.tgz"
  sha256 "5d60de44502611638676e653477013f7c8e3b8b2270f398503785b4a484b1ff4"
  license "MIT"
  def install
    bin.install "ordercli"
  end

  test do
    assert_match "multi-provider order CLI", shell_output("#{bin}/ordercli --help")
  end
end
