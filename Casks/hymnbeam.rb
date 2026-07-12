cask "hymnbeam" do
  version "0.1.9"
  sha256 "5db96df198f384312234d3453a980e2e29559e5ff92709e9a7ae79fc356c2ad4"

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
