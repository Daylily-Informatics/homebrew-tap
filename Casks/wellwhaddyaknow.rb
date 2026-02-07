cask "wellwhaddyaknow" do
  version "0.3.4"
  sha256 "7e7985e89f636c47f21ed89f065398dad19fc4271d1620647c6110cc4843e281"

  url "https://github.com/Daylily-Informatics/well-whaddya-know/releases/download/#{version}/WellWhaddyaKnow-#{version}.zip"
  name "WellWhaddyaKnow"
  desc "macOS time tracking with automatic activity detection"
  homepage "https://github.com/Daylily-Informatics/well-whaddya-know"

  depends_on macos: ">= :ventura"

  app "WellWhaddyaKnow.app"

  postflight do
    ohai "WellWhaddyaKnow installed. Launch from /Applications or Spotlight."
    ohai "The agent starts automatically via Login Items when you open the app."
    ohai "Grant Accessibility permission in System Settings > Privacy & Security."
  end

  zap trash: [
    "~/Library/Group Containers/group.com.daylily.wellwhaddyaknow",
    "~/Library/Preferences/com.daylily.wellwhaddyaknow.plist",
    "~/Library/LaunchAgents/com.daylily.wellwhaddyaknow.agent.plist",
  ]
end
