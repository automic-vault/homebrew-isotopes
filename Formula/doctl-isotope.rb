class DoctlIsotope < Formula
  desc "Automic Vault-signed release of the DigitalOcean CLI"
  homepage "https://github.com/automic-vault/doctl"
  url "https://github.com/automic-vault/doctl/releases/download/v1.179.0/cli-1.179.0.tgz"
  sha256 "e02b0ae1c8e5d398f024df9d8581754ef88ad913e438c47ccda1f07300b5dc84"
  license "Apache-2.0"

  depends_on :macos
  conflicts_with "doctl", because: "both install `doctl`"

  def install
    executable = Hardware::CPU.arm? ? "bin/doctl-arm64" : "bin/doctl-amd64"
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
