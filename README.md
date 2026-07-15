# Automic Vault Isotopes Homebrew Tap

Homebrew tap for Automic Vault and its isotopes.

```sh
brew trust automic-vault/isotopes

brew install --cask automic-vault/isotopes/automic-vault

brew rm gh supabase  # we obviously conflict with the upstream versions

brew install automic-vault/isotopes/gh-cli
brew install automic-vault/isotopes/supabase-cli
```

The formulae are updated hourly from the latest GitHub releases for:

- https://github.com/automic-vault/gh-cli
- https://github.com/automic-vault/supabase-cli
