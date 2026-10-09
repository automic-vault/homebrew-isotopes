cask "automic-vault" do
  version "4.18.0"
  sha256 "863d42def97a3a9d23a1210a28f2aedb9772b67710647c2aad1e2d8dbfe29bed"

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
  uninstall_postflight do
    system_command "/bin/launchctl",
                   args:         ["remove", "com.automicvault.menubar-helper"],
                   must_succeed: false
    launch_agent = Pathname("~/Library/LaunchAgents/com.automicvault.menubar-helper.plist").expand_path
    launch_agent.delete if launch_agent.exist?
  end

  uninstall quit: "com.automicvault"
end
