class WakatimeCliIsotope < Formula
  desc "Automic Vault build of WakaTime CLI"
  homepage "https://github.com/automic-vault/wakatime-cli"
  url "https://github.com/automic-vault/wakatime-cli/releases/download/v2.26.15/cli-2.26.15.tgz"
  sha256 "07c8ef5b08ebdaf2258a13c564efa41e762789a1c7fd7d1f86e0f3ddfff9e815"
  license "BSD-3-Clause"
  conflicts_with "wakatime-cli", because: "both install `wakatime-cli`"

  def install
    bin.install "wakatime-cli"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/wakatime-cli --version").strip
  end
end
