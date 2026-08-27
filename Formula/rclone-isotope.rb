class RcloneIsotope < Formula
  desc "Automic Vault build of rclone"
  homepage "https://github.com/automic-vault/rclone"
  url "https://github.com/automic-vault/rclone/releases/download/v1.75.0/cli-1.75.0.tgz"
  sha256 "fb43f74abde1cf2ddcd5a3508b05155d2e2d22182a7bfa758be88bd059b75744"
  license "MIT"
  conflicts_with "rclone", because: "both install `rclone`"

  def install
    bin.install "rclone"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rclone version --check=false")
  end
end
