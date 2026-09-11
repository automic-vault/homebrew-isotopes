class WranglerIsotope < Formula
  desc "Automic Vault build of Cloudflare Wrangler"
  homepage "https://github.com/automic-vault/wrangler"
  url "https://github.com/automic-vault/wrangler/releases/download/v4.131.1/cli-4.131.1.tgz"
  sha256 "c5482033b852cd9249350030c0b97f4d06487d97fa98bfb5dbe0acde58a637eb"
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
