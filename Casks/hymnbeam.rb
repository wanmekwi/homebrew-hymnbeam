cask "hymnbeam" do
  version "0.2.1"
  sha256 "9441cbac676c0f77d00cac2722472af33d0557364cffb66d59734d2c47f41d27"

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
