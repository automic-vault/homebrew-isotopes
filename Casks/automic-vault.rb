cask "automic-vault" do
  version "4.1.0"
  sha256 "4ffba6c267fe1a9b51166d6f507a5c19e3b2359d1ff50d3b3cc632f7cad72162"

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
