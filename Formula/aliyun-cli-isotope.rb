class AliyunCliIsotope < Formula
  desc "Automic Vault build of Alibaba Cloud CLI"
  homepage "https://github.com/automic-vault/aliyun-cli"
  url "https://github.com/automic-vault/aliyun-cli/releases/download/v3.4.11/cli-3.4.11.tgz"
  sha256 "25d9dce38b11b2ab0e1ffb91cc0f19134502f4f3c1cf947ccff438663d61468e"
  license "Apache-2.0"

  def install
    bin.install "aliyun"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aliyun version")
  end
end
