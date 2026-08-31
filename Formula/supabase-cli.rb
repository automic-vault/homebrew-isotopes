class SupabaseCli < Formula
  desc "Automic Vault build of Supabase CLI"
  homepage "https://github.com/automic-vault/supabase-cli"
  url "https://github.com/automic-vault/supabase-cli/releases/download/v2.116.0-1/cli-2.116.0-1.tgz"
  sha256 "b8e963f881408828bbffe753742387d8f58c8ca70d1fbce65d5bfe9f582fb41a"
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
