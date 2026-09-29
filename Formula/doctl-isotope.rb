class DoctlIsotope < Formula
  desc "Automic Vault-signed release of the DigitalOcean CLI"
  homepage "https://github.com/automic-vault/doctl"
  version "1.175.0-av.1"
  license "Apache-2.0"

  depends_on :macos
  conflicts_with "doctl", because: "both install `doctl`"

  on_arm do
    url "https://github.com/automic-vault/doctl/releases/download/v1.175.0-av.1/doctl-1.175.0-av.1-darwin-arm64.tar.gz"
    sha256 "a4565466d4541c7e223d338c7c7647b2bf22088e4103d3c534e050e6ae64f3b5"
  end

  on_intel do
    url "https://github.com/automic-vault/doctl/releases/download/v1.175.0-av.1/doctl-1.175.0-av.1-darwin-amd64.tar.gz"
    sha256 "cd227796d404f9dfb23d88bee85ce7d21ff5d78a974243050d378e783a5bf2a4"
  end

  def install
    system "/usr/bin/codesign", "--verify", "--strict", "-R",
           '=identifier "doctl" and anchor apple generic and certificate leaf[subject.OU] = "ZU76A67LGU"', "doctl"
    bin.install "doctl"
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
    assert_match "1.175.0", shell_output("#{bin}/doctl version")
  end
end
