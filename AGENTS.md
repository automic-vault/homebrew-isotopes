The core Automic Vault repository owns the authoritative domain language and
architecture. Read the sibling checkout's `../av/docs/domain-language.md` and
`../av/docs/architecture.md` before changing product language, security
concepts, authorization policy, formula documentation, or public copy. If the
sibling checkout is not available, use the canonical documents in
<https://github.com/automic-vault/automic-vault/tree/main/docs>.

Adopt and link to those definitions. Do not keep a competing copy in this
repository. Persisted values, wire fields, and compatibility flags may retain
legacy names; user-facing language must use the canonical term.

Before publishing a formula or release-builder change, run
`brew ruby Scripts/test-formula-install.rb Formula/<name>.rb <archive.tgz>`
against the exact release artifact (or `Scripts/test-formulae.sh` to download
published artifacts). This exercises Homebrew staging, installation, cleanup,
signature verification, and the formula test. Tar listings, `brew style`, and
source-tree binary checks do not establish that a formula installs or runs.
Keep this check before publication in both the builder and scheduled updater.

This checkout synchronizes with another Mac. Undo a committed mistake with a
revert commit; do not remove it only by rewriting local history, because the
other checkout can merge it back.
