class KubectlIsotope < Formula
  desc "Automic Vault build of kubectl"
  homepage "https://github.com/automic-vault/kubectl"
  url "https://github.com/automic-vault/kubectl/releases/download/v1.37.0/cli-1.37.0.tgz"
  sha256 "897afbaff4a1cf9fcf08df574e86c94d0e47a6ca0903fd1830176eaec30096ae"
  license "Apache-2.0"
  conflicts_with "kubernetes-cli", because: "both install `kubectl`"

  def install
    bin.install "kubectl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kubectl version --client")
  end
end
