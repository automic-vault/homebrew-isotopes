class RcloneIsotope < Formula
  desc "Automic Vault build of rclone"
  homepage "https://github.com/automic-vault/rclone"
  url "https://github.com/automic-vault/rclone/releases/download/v1.75.0/cli-1.75.0.tgz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"
  conflicts_with "rclone", because: "both install `rclone`"

  def install
    bin.install "rclone"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rclone version --check=false")
  end
end
