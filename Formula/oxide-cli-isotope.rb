class OxideCliIsotope < Formula
  desc "Automic Vault build of oxide"
  homepage "https://github.com/automic-vault/oxide.rs"
  url "https://github.com/automic-vault/oxide.rs/releases/download/v0.18.0+2026073100.0.0/cli-0.18.0+2026073100.0.0.tgz"
  sha256 "98b89bbdbb6343b984e676857b237414b3e7bc6dfad7302174aded453bf808ba"
  license "MPL-2.0"
  def install
    bin.install "oxide"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/oxide version")
  end
end
