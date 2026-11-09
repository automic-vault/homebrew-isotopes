class SupabaseCli < Formula
  desc "Automic Vault build of Supabase CLI"
  homepage "https://github.com/automic-vault/supabase-cli"
  url "https://github.com/automic-vault/supabase-cli/releases/download/v3.1.0/cli-3.1.0.tgz"
  sha256 "21f55b36493af22574b60e13651339b684fa02c78cbfcabea8fb3cf2c53a912f"
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
