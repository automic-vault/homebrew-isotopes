class RcloneIsotope < Formula
  desc "Automic Vault build of rclone"
  homepage "https://github.com/automic-vault/rclone"
  url "https://github.com/automic-vault/rclone/releases/download/v1.76.0/cli-1.76.0.tgz"
  sha256 "902336f62ec2829632b52ce49c1952686d43377caa28ef1b508770e1cdc33a54"
  license "MIT"
  conflicts_with "rclone", because: "both install `rclone`"

  def install
    bin.install "rclone"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rclone version --check=false")
  end
end
