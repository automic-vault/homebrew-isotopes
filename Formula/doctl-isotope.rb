class DoctlIsotope < Formula
  desc "Automic Vault-signed release of the DigitalOcean CLI"
  homepage "https://github.com/automic-vault/doctl"
  url "https://github.com/automic-vault/doctl/releases/download/v2.1.0/cli-2.1.0.tgz"
  sha256 "b6d2559ed16abafaf4ad63a911b71d71e944ec5a65279b87e5df441b2a19d637"
  license "Apache-2.0"

  depends_on :macos
  conflicts_with "doctl", because: "both install `doctl`"

  def install
    executable = Hardware::CPU.arm? ? "doctl-arm64" : "doctl-amd64"
    system "/usr/bin/codesign", "--verify", "--strict", "-R",
           '=identifier "doctl" and anchor apple generic and certificate leaf[subject.OU] = "ZU76A67LGU"', executable
    bin.install executable => "doctl"
  end

  def caveats
    <<~EOS
      This installs the signed upstream executable. For protected token routing,
      run `av harden doctl`. AV owns the pinned Target under /opt/av/doctl and its
      launcher at /usr/local/bin/doctl; put /usr/local/bin before this formula on PATH.
      Re-hardening repairs AV's pinned release. Formula updates do not change it.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/doctl version")
  end
end
