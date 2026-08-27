class UaaCliIsotope < Formula
  desc "Automic Vault build of UAA CLI"
  homepage "https://github.com/automic-vault/uaa-cli"
  url "https://github.com/automic-vault/uaa-cli/releases/download/v0.22.0/cli-0.22.0.tgz"
  sha256 "79c44b43aa665362e40f0fcf70772b433d077e251dd3e13e8e445c052a0e0d7b"
  license "Apache-2.0"
  def install
    bin.install "uaa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/uaa version")
  end
end
