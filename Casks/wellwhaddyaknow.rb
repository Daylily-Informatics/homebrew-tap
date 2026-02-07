cask "wellwhaddyaknow" do
  version "0.3.2"
  sha256 "2daaa000eabe4248420d393672061d4d4ad20c08cd43988abedd8c82693a0cf3"

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
