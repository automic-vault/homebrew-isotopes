class RailwayIsotope < Formula
  desc "Automic Vault build of Railway CLI"
  homepage "https://github.com/automic-vault/railway-cli"
  url "https://github.com/automic-vault/railway-cli/releases/download/v5.45.9/cli-5.45.9.tgz"
  sha256 "72f639050b8abaaef441cac9941d0f0e894c3eddec2fc186b46d0ac5adfcb17e"
  license "MIT"
  conflicts_with "railway", because: "both install `railway`"

  def install
    bin.install "railway"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/railway --version")
  end
end
