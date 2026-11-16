class OrdercliIsotope < Formula
  desc "Automic Vault build of ordercli"
  homepage "https://github.com/automic-vault/ordercli"
  url "https://github.com/automic-vault/ordercli/releases/download/v0.2.4/cli-0.2.4.tgz"
  sha256 "75701cf0f1b3929ee089eae3b822b5d1391a70f833552dcadc132c2d119b2151"
  license "MIT"
  def install
    bin.install "ordercli"
  end

  test do
    assert_match "multi-provider order CLI", shell_output("#{bin}/ordercli --help")
  end
end
