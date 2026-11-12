class WranglerIsotope < Formula
  desc "Automic Vault build of Cloudflare Wrangler"
  homepage "https://github.com/automic-vault/wrangler"
  url "https://github.com/automic-vault/wrangler/releases/download/v4.161.0/cli-4.161.0.tgz"
  sha256 "0916d38212e4b6732911cd3b219128700252822799ccd2470f433f507c9e2c13"
  license "Apache-2.0"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  # Rewriting signed library IDs would invalidate the bundle's resource seal.
  preserve_rpath

  def install
    # Homebrew stages inside the archive's single top-level Wrangler.app directory.
    (libexec/"Wrangler.app").install "Contents"
    (bin/"wrangler").write <<~SH
      #!/bin/sh
      target=/opt/av/wrangler/Wrangler.app/Contents/MacOS/wrangler
      if [ ! -x "$target" ]; then
        echo 'Run `av harden wrangler` to install the protected Wrangler runtime.' >&2
        exit 1
      fi
      exec "$target" "$@"
    SH
    (bin/"wrangler").chmod 0755
  end

  def caveats
    <<~EOS
      Run `av harden wrangler` after installing or upgrading to verify and
      install the protected runtime. Before switching, log out of each
      upstream Wrangler auth profile, then log in through the Isotope.
    EOS
  end

  test do
    assert_predicate bin/"wrangler", :executable?
    unless Pathname("/opt/av/wrangler/Wrangler.app/Contents/MacOS/wrangler").executable?
      assert_match "av harden wrangler", shell_output("#{bin}/wrangler --version 2>&1", 1)
    end
    system "/usr/bin/codesign", "--verify", "--deep", "--strict", libexec/"Wrangler.app"
  end
end
