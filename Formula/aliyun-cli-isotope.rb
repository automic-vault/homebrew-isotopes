class AliyunCliIsotope < Formula
  desc "Automic Vault build of Alibaba Cloud CLI"
  homepage "https://github.com/automic-vault/aliyun-cli"
  url "https://github.com/automic-vault/aliyun-cli/releases/download/v3.5.3/cli-3.5.3.tgz"
  sha256 "4e74ad3719e6df5f3036e70e0f30a9952aff6fc4d8ca77b0a86dce783ef148fa"
  license "Apache-2.0"

  def install
    bin.install "aliyun"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aliyun version")
  end
end
