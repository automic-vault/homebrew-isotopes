cask "automic-vault" do
  version "4.12.2"
  sha256 "8e6aaba1ff543417fe62e04fa7c34c7a5c841e9218f40fbc8e829922cd6b38f9"

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
