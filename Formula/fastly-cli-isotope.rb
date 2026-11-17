class FastlyCliIsotope < Formula
  desc "Automic Vault build of Fastly CLI"
  homepage "https://github.com/automic-vault/fastly-cli"
  url "https://github.com/automic-vault/fastly-cli/releases/download/v17.2.0/cli-17.2.0.tgz"
  sha256 "a6cf328208a04db4d3bc49551bb0ecca48c3ed57e11b1fe4cee1f37adcafc78e"
  license "Apache-2.0"
  conflicts_with "fastly", because: "both install `fastly`"

  def install
    bin.install "fastly"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fastly version")
  end
end
