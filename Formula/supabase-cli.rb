class SupabaseCli < Formula
  desc "Automic Vault build of Supabase CLI"
  homepage "https://github.com/automic-vault/supabase-cli"
  url "https://github.com/automic-vault/supabase-cli/releases/download/v2.122.0/cli-2.122.0.tgz"
  sha256 "a95823b8896e856c4a91853f49aedbff92dcb9707526b6985db95d31460eb271"
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
