cask "automic-vault" do
  version "4.3.0"
  sha256 "57a7e826a39976df4fab508e1a67bd6e62d289368a5c170d478d4fa8a8d6481b"

  url "https://github.com/automic-vault/automic-vault/releases/download/#{version}/Automic-Vault-#{version}.dmg"
  name "Automic Vault"
  desc "Command-line security layer for developer environments"
  homepage "https://www.automicvault.com/"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Automic Vault.app"

  uninstall launchctl: "com.automicvault.menubar-helper",
            quit:      "com.automicvault"
end
