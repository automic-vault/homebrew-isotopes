class SqlcmdIsotope < Formula
  desc "Automic Vault build of Microsoft sqlcmd"
  homepage "https://github.com/automic-vault/go-sqlcmd"
  url "https://github.com/automic-vault/go-sqlcmd/releases/download/v1.10.0/cli-1.10.0.tgz"
  sha256 "350ea793e62622d20fa3f7b81bc2e25df4c859493834e97981f4117a0269add9"
  license "MIT"
  conflicts_with "sqlcmd", because: "both install `sqlcmd`"

  def install
    bin.install "sqlcmd"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sqlcmd --version")
  end
end
