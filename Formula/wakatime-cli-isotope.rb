class WakatimeCliIsotope < Formula
  desc "Automic Vault build of WakaTime CLI"
  homepage "https://github.com/automic-vault/wakatime-cli"
  url "https://github.com/automic-vault/wakatime-cli/releases/download/v2.27.13/cli-2.27.13.tgz"
  sha256 "059652023c6de204107f7ec5e9785012060319a3fcf5421a37a4b0c4a74bd920"
  license "BSD-3-Clause"
  conflicts_with "wakatime-cli", because: "both install `wakatime-cli`"

  def install
    bin.install "wakatime-cli"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/wakatime-cli --version").strip
  end
end
