cask "hymnbeam" do
  version "0.1.4"
  sha256 "e32200092327c830b00aa85cb0692ab201619fc6390566f6eaa734aa24d6439f"

  url "https://github.com/wanmekwi/hymnbeam/releases/download/v#{version}/HymnBeam_#{version}_universal.dmg"
  name "HymnBeam"
  desc "Church song-lyrics projector with KJV Bible integration"
  homepage "https://github.com/wanmekwi/hymnbeam"

  app "HymnBeam.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/HymnBeam.app"],
                   sudo: false
  end

  uninstall quit: "com.hymnbeam.app"

  zap trash: [
    "~/Library/Application Support/HymnBeam",
    "~/Library/Preferences/com.hymnbeam.app.plist",
    "~/Library/Saved Application State/com.hymnbeam.app.savedState",
  ]
end
