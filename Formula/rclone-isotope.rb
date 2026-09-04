class RcloneIsotope < Formula
  desc "Automic Vault build of rclone"
  homepage "https://github.com/automic-vault/rclone"
  url "https://github.com/automic-vault/rclone/releases/download/v1.75.1/cli-1.75.1.tgz"
  sha256 "aa2cf4b99743b0e9aa5959dde9a613d1cf32628dc1bf14449a838f6b08fc8671"
  license "MIT"
  conflicts_with "rclone", because: "both install `rclone`"

  def install
    bin.install "rclone"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rclone version --check=false")
  end
end
