class Ordercli < Formula
  desc "Automic Vault build of ordercli"
  homepage "https://github.com/automic-vault/ordercli"
  url "https://github.com/automic-vault/ordercli/releases/download/v0.1.0/cli-0.1.0.tgz"
  sha256 "684cc8c3ac502afc4ffa31db6c2fb26e68c59e02bbf0e8d1dc7c60b181a2d96d"
  license "MIT"
  conflicts_with "ordercli", because: "both install `ordercli`"

  def install
    bin.install "ordercli"
  end

  test do
    assert_match "multi-provider order CLI", shell_output("#{bin}/ordercli --help")
  end
end
