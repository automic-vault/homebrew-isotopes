class OxideCliIsotope < Formula
  desc "Automic Vault build of oxide"
  homepage "https://github.com/automic-vault/oxide.rs"
  url "https://github.com/automic-vault/oxide.rs/releases/download/v0.19.1+2026091500.0.0/cli-0.19.1+2026091500.0.0.tgz"
  sha256 "ef5d7fd787306b6b2c5733dfaeeb422ca0165e24f4a419f00d39f0497a66306e"
  license "MPL-2.0"
  def install
    bin.install "bin/oxide"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/oxide version")
  end
end
