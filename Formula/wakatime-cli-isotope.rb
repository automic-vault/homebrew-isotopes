class WakatimeCliIsotope < Formula
  desc "Automic Vault build of WakaTime CLI"
  homepage "https://github.com/automic-vault/wakatime-cli"
  url "https://github.com/automic-vault/wakatime-cli/releases/download/v2.27.1/cli-2.27.1.tgz"
  sha256 "8cba712b5e0f65892f2c59fd6300d184ccaa84bb7e31f258bbb4baa0db99cc65"
  license "BSD-3-Clause"
  conflicts_with "wakatime-cli", because: "both install `wakatime-cli`"

  def install
    bin.install "wakatime-cli"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/wakatime-cli --version").strip
  end
end
