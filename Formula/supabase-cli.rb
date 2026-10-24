class SupabaseCli < Formula
  desc "Automic Vault build of Supabase CLI"
  homepage "https://github.com/automic-vault/supabase-cli"
  url "https://github.com/automic-vault/supabase-cli/releases/download/v2.121.0/cli-2.121.0.tgz"
  sha256 "67882546c9a88ae45326fbe83ce9956cc45b265075c590f0e2e118e0f0255643"
  license "MIT"
  conflicts_with "supabase", because: "both install `supabase`"

  def install
    bin.install "bin/supabase"
    bin.install "bin/supabase-go"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/supabase --version")
  end
end
