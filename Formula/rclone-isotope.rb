class RcloneIsotope < Formula
  desc "Automic Vault build of rclone"
  homepage "https://github.com/automic-vault/rclone"
  url "https://github.com/automic-vault/rclone/releases/download/v1.75.2/cli-1.75.2.tgz"
  sha256 "d28b651a0ca18dfa0b15e57442185064be323b90120ee3415efa3bc2e282a466"
  license "MIT"
  conflicts_with "rclone", because: "both install `rclone`"

  def install
    bin.install "rclone"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rclone version --check=false")
  end
end
