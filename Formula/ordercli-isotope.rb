class OrdercliIsotope < Formula
  desc "Automic Vault build of ordercli"
  homepage "https://github.com/automic-vault/ordercli"
  url "https://github.com/automic-vault/ordercli/releases/download/v0.2.3/cli-0.2.3.tgz"
  sha256 "bbc8d11f3c72d224a50c422f1b4ca3de26e79f75324b885dfbafbf3b44e82d72"
  license "MIT"
  def install
    bin.install "ordercli"
  end

  test do
    assert_match "multi-provider order CLI", shell_output("#{bin}/ordercli --help")
  end
end
