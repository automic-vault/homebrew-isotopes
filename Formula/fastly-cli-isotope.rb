class FastlyCliIsotope < Formula
  desc "Automic Vault build of Fastly CLI"
  homepage "https://github.com/automic-vault/fastly-cli"
  url "https://github.com/automic-vault/fastly-cli/releases/download/v16.0.0/cli-16.0.0.tgz"
  sha256 "477c301da4aef254a34de53b328e0121a671b53496d283e56c5beac2ce132d36"
  license "Apache-2.0"
  conflicts_with "fastly", because: "both install `fastly`"

  def install
    bin.install "fastly"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fastly version")
  end
end
