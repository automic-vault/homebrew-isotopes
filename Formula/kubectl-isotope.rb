class KubectlIsotope < Formula
  desc "Automic Vault build of kubectl"
  homepage "https://github.com/automic-vault/kubectl"
  url "https://github.com/automic-vault/kubectl/releases/download/v1.37.3/cli-1.37.3.tgz"
  sha256 "bbb1d86779289bc852adadd38a2bb8e2e51f0b35dd35910123bd5176407e23f5"
  license "Apache-2.0"
  conflicts_with "kubernetes-cli", because: "both install `kubectl`"

  def install
    bin.install "kubectl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kubectl version --client")
  end
end
