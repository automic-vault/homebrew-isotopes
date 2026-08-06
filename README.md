# Automic Vault Isotopes Homebrew Tap

Homebrew tap for Automic Vault and its Isotopes.

An **Isotope** is an Automic Vault-compatible build or wrapper of a third-party
Tool. It gives a Hardener the integration it needs when the upstream Tool cannot
support Automic Vault's Local Execution Boundary. An Isotope is a distribution
artifact, not a Detector, Hardener, or Secret.

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

The core repository owns the authoritative [Domain Language] and
[Architecture].

[Domain Language]: https://github.com/automic-vault/automic-vault/blob/main/docs/domain-language.md
[Architecture]: https://github.com/automic-vault/automic-vault/blob/main/docs/architecture.md
