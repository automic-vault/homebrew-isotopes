#!/bin/bash
set -euo pipefail

repo_root="$(git rev-parse --show-toplevel)"
cd "$repo_root"
fixture="$(mktemp -d "${TMPDIR:-/tmp}/isotope-formulae.XXXXXX")"
trap 'rm -rf "$fixture"' EXIT

if [[ $# -eq 0 ]]; then
  set -- Formula/*.rb
fi
for formula in "$@"; do
  url="$(ruby -e 'puts File.read(ARGV.fetch(0)).match(/^  url "([^"]+)"/)[1]' "$formula")"
  curl --fail --location --retry 2 "$url" --output "$fixture/archive.tgz"
  HOMEBREW_NO_AUTO_UPDATE=1 brew ruby "$repo_root/Scripts/test-formula-install.rb" "$formula" "$fixture/archive.tgz"
done
