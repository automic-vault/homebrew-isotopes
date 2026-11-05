class WranglerIsotope < Formula
  desc "Automic Vault build of Cloudflare Wrangler"
  homepage "https://github.com/automic-vault/wrangler"
  url "https://github.com/automic-vault/wrangler/releases/download/v4.158.0/cli-4.158.0.tgz"
  sha256 "cc766efcf1e7602f43d5cbfe649a180110eaca55ea1f5766d3b775a0e05ff3c7"
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
