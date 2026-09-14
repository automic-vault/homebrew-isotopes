cask "automic-vault" do
  version "4.10.0"
  sha256 "e0a34fb08e4de7ccb532bd8c33d34a4c05de4b1cc828963e37e0a6b9c7115d24"

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
