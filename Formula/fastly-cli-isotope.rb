class FastlyCliIsotope < Formula
  desc "Automic Vault build of Fastly CLI"
  homepage "https://github.com/automic-vault/fastly-cli"
  url "https://github.com/automic-vault/fastly-cli/releases/download/v16.2.0/cli-16.2.0.tgz"
  sha256 "b6ec577ab2812f449cc82b30bfede133b6ba278a1f1a3de6f37d67e261917a43"
  license "Apache-2.0"
  conflicts_with "fastly", because: "both install `fastly`"

  def install
    bin.install "fastly"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fastly version")
  end
end
