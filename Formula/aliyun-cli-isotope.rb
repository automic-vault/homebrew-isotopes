class AliyunCliIsotope < Formula
  desc "Automic Vault build of Alibaba Cloud CLI"
  homepage "https://github.com/automic-vault/aliyun-cli"
  url "https://github.com/automic-vault/aliyun-cli/releases/download/v3.5.0/cli-3.5.0.tgz"
  sha256 "b73a0374f17dee8058348b1340df235b26da848a1f4f9dca217b3a765067d69e"
  license "Apache-2.0"

  def install
    bin.install "aliyun"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aliyun version")
  end
end
