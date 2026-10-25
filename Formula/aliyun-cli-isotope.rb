class AliyunCliIsotope < Formula
  desc "Automic Vault build of Alibaba Cloud CLI"
  homepage "https://github.com/automic-vault/aliyun-cli"
  url "https://github.com/automic-vault/aliyun-cli/releases/download/v3.5.2.1/cli-3.5.2.1.tgz"
  sha256 "2884eb87d5238c33d25642790e8be96ad04dab91ee33b6f60c7d3ff96802ec1b"
  license "Apache-2.0"

  def install
    bin.install "aliyun"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aliyun version")
  end
end
