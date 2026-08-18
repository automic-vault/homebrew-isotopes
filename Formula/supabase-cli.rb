class SupabaseCli < Formula
  desc "Automic Vault build of Supabase CLI"
  homepage "https://github.com/automic-vault/supabase-cli"
  url "https://github.com/automic-vault/supabase-cli/releases/download/v2.115.0/cli-2.115.0.tgz"
  sha256 "f7adeca7dcc7d44e2a143f9986cdaaafdd01699813e3b1dad01b6baa3f9ed1b6"
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
