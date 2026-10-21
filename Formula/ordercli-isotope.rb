class OrdercliIsotope < Formula
  desc "Automic Vault build of ordercli"
  homepage "https://github.com/automic-vault/ordercli"
  url "https://github.com/automic-vault/ordercli/releases/download/v0.2.2/cli-0.2.2.tgz"
  sha256 "cacc6594855da5e117c170af1bc5a7a7fbf951bc90439beb4ad20543cd0a9cb6"
  license "MIT"
  def install
    bin.install "bin/ordercli"
  end

  test do
    assert_match "multi-provider order CLI", shell_output("#{bin}/ordercli --help")
  end
end
