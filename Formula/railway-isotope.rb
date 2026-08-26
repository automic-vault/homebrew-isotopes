class RailwayIsotope < Formula
  desc "Automic Vault build of Railway CLI"
  homepage "https://github.com/automic-vault/railway-cli"
  url "https://github.com/automic-vault/railway-cli/releases/download/v5.44.1/cli-5.44.1.tgz"
  sha256 "cfeafcafa78f48fa65387e67d7843a422fd0e5f1f53d836db4c1353eae8f5d3f"
  license "MIT"
  conflicts_with "railway", because: "both install `railway`"

  def install
    bin.install "railway"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/railway --version")
  end
end
