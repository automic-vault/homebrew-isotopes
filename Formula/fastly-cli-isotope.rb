class FastlyCliIsotope < Formula
  desc "Automic Vault build of Fastly CLI"
  homepage "https://github.com/automic-vault/fastly-cli"
  url "https://github.com/automic-vault/fastly-cli/releases/download/v16.1.0/cli-16.1.0.tgz"
  sha256 "221cd5d7a1207fcc085bbb250421d148c8361b1c8d8eec6806d9188269558731"
  license "Apache-2.0"
  conflicts_with "fastly", because: "both install `fastly`"

  def install
    bin.install "fastly"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fastly version")
  end
end
