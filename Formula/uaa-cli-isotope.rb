class UaaCliIsotope < Formula
  desc "Automic Vault build of UAA CLI"
  homepage "https://github.com/automic-vault/uaa-cli"
  url "https://github.com/automic-vault/uaa-cli/releases/download/v0.21.0/cli-0.21.0.tgz"
  sha256 "83351f39b9c664f9cc4671a6b714fec919aa2c1fa034112f11329d83c97cb399"
  license "Apache-2.0"
  def install
    bin.install "uaa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/uaa version")
  end
end
