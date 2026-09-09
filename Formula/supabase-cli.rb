class SupabaseCli < Formula
  desc "Automic Vault build of Supabase CLI"
  homepage "https://github.com/automic-vault/supabase-cli"
  url "https://github.com/automic-vault/supabase-cli/releases/download/v2.117.0/cli-2.117.0.tgz"
  sha256 "7530688ff7739670dacba1abf02b68182f77f9c138719a4b884e6133a73110b7"
  license "MIT"
  conflicts_with "supabase", because: "both install `supabase`"

  def install
    bin.install "supabase"
    bin.install "supabase-go"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/supabase --version")
  end
end
