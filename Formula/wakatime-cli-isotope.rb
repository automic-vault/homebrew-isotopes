class WakatimeCliIsotope < Formula
  desc "Automic Vault build of WakaTime CLI"
  homepage "https://github.com/automic-vault/wakatime-cli"
  url "https://github.com/automic-vault/wakatime-cli/releases/download/v2.26.14/cli-2.26.14.tgz"
  sha256 "c20c4f64fd643581330708e1624ea1cdc88bdafc110f71da76f3d59c1a7921da"
  license "BSD-3-Clause"
  conflicts_with "wakatime-cli", because: "both install `wakatime-cli`"

  def install
    bin.install "wakatime-cli"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/wakatime-cli --version").strip
  end
end
