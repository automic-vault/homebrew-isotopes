class KubectlIsotope < Formula
  desc "Automic Vault build of kubectl"
  homepage "https://github.com/automic-vault/kubectl"
  url "https://github.com/automic-vault/kubectl/releases/download/v1.37.1/cli-1.37.1.tgz"
  sha256 "a1c031f608ae7795104dac98b6bc4628bc0a353b7efe11c9fb4db37d4c0e3690"
  license "Apache-2.0"
  conflicts_with "kubernetes-cli", because: "both install `kubectl`"

  def install
    bin.install "kubectl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kubectl version --client")
  end
end
