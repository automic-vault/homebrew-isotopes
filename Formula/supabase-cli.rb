class SupabaseCli < Formula
  desc "Automic Vault build of Supabase CLI"
  homepage "https://github.com/automic-vault/supabase-cli"
  url "https://github.com/automic-vault/supabase-cli/releases/download/v2.111.0/cli-2.111.0.tgz"
  sha256 "0dada1d225b6ebdbe5f004c9d309580942fea710bc475a096826e7fa367bd04f"
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
