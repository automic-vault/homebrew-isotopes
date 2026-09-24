class WakatimeCliIsotope < Formula
  desc "Automic Vault build of WakaTime CLI"
  homepage "https://github.com/automic-vault/wakatime-cli"
  url "https://github.com/automic-vault/wakatime-cli/releases/download/v2.26.7/cli-2.26.7.tgz"
  sha256 "6623af99cfc4a8f856220924d0af5c92fe7eb9fc35f5edbe67f001918683087c"
  license "BSD-3-Clause"
  conflicts_with "wakatime-cli", because: "both install `wakatime-cli`"

  def install
    bin.install "wakatime-cli"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/wakatime-cli --version").strip
  end
end
