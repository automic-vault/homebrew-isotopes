class AliyunCliIsotope < Formula
  desc "Automic Vault build of Alibaba Cloud CLI"
  homepage "https://github.com/automic-vault/aliyun-cli"
  url "https://github.com/automic-vault/aliyun-cli/releases/download/v3.5.2/cli-3.5.2.tgz"
  sha256 "d65404b44fe358e710b971e8a06a52c85590dee383d3ce73faf6c47ad2b9f4fd"
  license "Apache-2.0"

  def install
    bin.install "aliyun"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aliyun version")
  end
end
