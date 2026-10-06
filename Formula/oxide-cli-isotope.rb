class OxideCliIsotope < Formula
  desc "Automic Vault build of oxide"
  homepage "https://github.com/automic-vault/oxide.rs"
  url "https://github.com/automic-vault/oxide.rs/releases/download/v0.19.0+2026091500.0.0/cli-0.19.0+2026091500.0.0.tgz"
  sha256 "1b5ee9a39005a4ee40fa750247fcd5b4bb5a662c96fa123e029b7a38c6b4d216"
  license "MPL-2.0"
  def install
    bin.install "oxide"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/oxide version")
  end
end
