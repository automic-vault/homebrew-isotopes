cask "automic-vault" do
  version "4.20.1"
  sha256 "fa43bee7505851c114bf6d0f504951a17ae8a97582c97179a2fc23c639fd776d"

  url "https://github.com/automic-vault/automic-vault/releases/download/#{version}/Automic-Vault-#{version}.dmg"
  name "Automic Vault"
  desc "Command-line security layer for developer environments"
  homepage "https://www.automicvault.com/"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Automic Vault.app"

  # The menubar helper Launch Agent runs the app itself, so removing it before
  # `quit` would close the app without Homebrew recording it for reopening
  # after an upgrade. Quit first, then remove the Launch Agent.
  uninstall_postflight_steps do
    run "/bin/launchctl", args: ["remove", "com.automicvault.menubar-helper"], must_succeed: false
    remove "~/Library/LaunchAgents/com.automicvault.menubar-helper.plist"
  end

  uninstall quit: "com.automicvault"
end
