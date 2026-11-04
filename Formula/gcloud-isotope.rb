class GcloudIsotope < Formula
  desc "Automic Vault build of Google Cloud CLI"
  homepage "https://github.com/automic-vault/gcloud"
  url "https://github.com/automic-vault/gcloud/releases/download/v592.0.0/cli-592.0.0.tgz"
  sha256 "35b74a86f57ba7e357316c7ddbea0ad646ead2932eea6a2ec1981e68cea27ddb"
  license "Apache-2.0"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  # Rewriting signed library IDs would invalidate the bundle's resource seal.
  preserve_rpath
  skip_clean "libexec"

  def install
    # Homebrew stages inside the archive's single top-level Gcloud.app directory.
    (libexec/"Gcloud.app").install "Contents"
    (bin/"gcloud").write <<~SH
      #!/bin/sh
      target=/opt/av/gcloud/Gcloud.app/Contents/MacOS/gcloud
      if [ ! -x "$target" ]; then
        echo 'Run `av harden gcloud` to install the protected gcloud runtime.' >&2
        exit 1
      fi
      exec "$target" "$@"
    SH
    (bin/"gcloud").chmod 0755
  end

  def caveats
    <<~EOS
      Run `av harden gcloud` after installing or upgrading to verify and
      install the protected runtime. Before switching, revoke existing upstream
      sessions, then run `gcloud auth login` through the Isotope. ADC and companion tools are not covered.
    EOS
  end

  test do
    assert_predicate bin/"gcloud", :executable?
    unless Pathname("/opt/av/gcloud/Gcloud.app/Contents/MacOS/gcloud").executable?
      assert_match "av harden gcloud", shell_output("#{bin}/gcloud --version 2>&1", 1)
    end
    system "/usr/bin/codesign", "--verify", "--deep", "--strict", "--verbose=4", libexec/"Gcloud.app"
  end
end
