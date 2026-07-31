cask "clipdeck" do
  version "1.2.0"
  sha256 "f5f8fc258779101e90d20dc11c0efc0f81fade219bd3c10889704d6012109b58"

  url "https://clipdeck-mac.vercel.app/downloads/ClipDeck.dmg"
  name "ClipDeck"
  desc "Native, privacy-first clipboard manager for macOS"
  homepage "https://clipdeck-mac.vercel.app/"

  depends_on macos: :ventura

  app "ClipDeck.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/ClipDeck.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Clipdeck",
    "~/Library/Preferences/com.clipdeck.app.plist",
  ]
end
