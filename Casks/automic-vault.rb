cask "automic-vault" do
  version "3.6.0"
  sha256 "21947cf5187a95f45f58c4610f97fe5a9fbcf0e94c4ee6b7a852e628fccf8153"

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
