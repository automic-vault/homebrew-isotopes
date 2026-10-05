#!/bin/bash
set -euo pipefail

repo_root="$(git rev-parse --show-toplevel)"
fixture="$(mktemp -d "${TMPDIR:-/tmp}/build-isotopes-test.XXXXXX")"
trap 'rm -rf "$fixture"' EXIT

mkdir -p "$fixture/bin" "$fixture/clones/doctl"
git -C "$fixture/clones/doctl" init --quiet
git -C "$fixture/clones/doctl" remote add origin https://example.invalid/doctl.git

# shellcheck disable=SC2016
printf '%s\n' \
  '#!/bin/bash' \
  'set -euo pipefail' \
  'if [[ "$1 $2" == "repo list" ]]; then' \
  '  echo doctl' \
  'elif [[ "$1" == api && "${!#}" == "/repos/automic-vault/doctl" ]]; then' \
  '  echo '\''{"parent":{"full_name":"digitalocean/doctl","default_branch":"main"},"default_branch":"main"}'\''' \
  'elif [[ "$1" == api && "${!#}" == "/repos/digitalocean/doctl/releases/latest" ]]; then' \
  '  echo '\''{"tag_name":"v1.177.0","html_url":"https://example.invalid/v1.177.0"}'\''' \
  'else' \
  '  echo "unexpected gh invocation: $*" >&2' \
  '  exit 1' \
  'fi' >"$fixture/bin/gh"
chmod +x "$fixture/bin/gh"

set +e
output="$(
  PATH="$fixture/bin:$PATH" \
    bash "$repo_root/Scripts/build-isotopes.sh" \
      --dry-run \
      --clone-root "$fixture/clones" \
      --repo doctl 2>&1
)"
status=$?
set -e

printf '%s\n' "$output"
[[ "$status" -eq 75 ]]
grep -Fq 'CONTROLLING AGENT ACTION REQUIRED' <<<"$output"
grep -Fq 'Latest upstream release tag: v1.177.0' <<<"$output"
grep -Fq 'Missing file:' <<<"$output"
grep -Fq 'Then retry discovery with:' <<<"$output"
if grep -Fq 'Skipping automic-vault/doctl' <<<"$output"; then
  echo "missing manifests must not be reported as successful skips" >&2
  exit 1
fi
