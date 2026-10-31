class KubectlIsotope < Formula
  desc "Automic Vault build of kubectl"
  homepage "https://github.com/automic-vault/kubectl"
  url "https://github.com/automic-vault/kubectl/releases/download/v1.37.2/cli-1.37.2.tgz"
  sha256 "11a0e7f96bd760bf65be8f90a5e1dda21e66da72a4af4db5c4a8ccaa8e418027"
  license "Apache-2.0"
  conflicts_with "kubernetes-cli", because: "both install `kubectl`"

  def install
    bin.install "kubectl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kubectl version --client")
  end
end
