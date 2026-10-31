class OpenhueCliIsotope < Formula
  desc "Automic Vault build of OpenHue CLI"
  homepage "https://github.com/automic-vault/openhue-cli"
  url "https://github.com/automic-vault/openhue-cli/releases/download/0.25/cli-0.25.tgz"
  sha256 "36828461db1505cc8607662eca63dfaee4ef5a70a550c8c55cbba120b1fccf35"
  license "Apache-2.0"
  def install
    bin.install "openhue"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/openhue version")
  end
end
