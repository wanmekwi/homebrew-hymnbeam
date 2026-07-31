cask "hymnbeam" do
  version "0.4.0"
  sha256 "ab223a19e5f00453ce3ac73feda6bad407bd66ccda568caafecc1a8ee15c878e"

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
