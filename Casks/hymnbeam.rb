cask "hymnbeam" do
  version "0.5.1"
  sha256 "882cdba4ded162abd2e4cb1507f58ec70a3c2843610b19fc299aad017ab2f02f"

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
