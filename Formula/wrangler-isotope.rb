class WranglerIsotope < Formula
  desc "Automic Vault build of Cloudflare Wrangler"
  homepage "https://github.com/automic-vault/wrangler"
  url "https://github.com/automic-vault/wrangler/releases/download/v4.129.0/cli-4.129.0.tgz"
  sha256 "b7226e51c82c563ca081b52695121bcd58e7fea6fffd1a4cecaf6fe811d851bd"
  license "Apache-2.0"

  depends_on arch: :arm64
  depends_on :macos

  def install
    libexec.install "Wrangler.app"
    (bin/"wrangler").write <<~SH
      #!/bin/sh
      target=/opt/av/wrangler/Wrangler.app/Contents/MacOS/wrangler
      if [ ! -x "$target" ]; then
        echo 'Run `av harden wrangler` to install the protected Wrangler runtime.' >&2
        exit 1
      fi
      exec "$target" "$@"
    SH
  end

  def caveats
    <<~EOS
      Run `av harden wrangler` after installing or upgrading to verify and
      install the protected runtime. Before switching, log out of each
      upstream Wrangler auth profile, then log in through the Isotope.
    EOS
  end

  test do
    system "/usr/bin/codesign", "--verify", "--deep", "--strict", libexec/"Wrangler.app"
  end
end
