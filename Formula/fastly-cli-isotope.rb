class FastlyCliIsotope < Formula
  desc "Automic Vault build of Fastly CLI"
  homepage "https://github.com/automic-vault/fastly-cli"
  url "https://github.com/automic-vault/fastly-cli/releases/download/v17.0.0/cli-17.0.0.tgz"
  sha256 "31ba4d721c03661ce2a65dc41bc84eb04fd8d859f4807d94c6e340071e473b34"
  license "Apache-2.0"
  conflicts_with "fastly", because: "both install `fastly`"

  def install
    bin.install "fastly"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fastly version")
  end
end
