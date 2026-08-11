cask "clipdeck" do
  version "1.2.9"
  sha256 "f0578bc5a2bf23364b25a1392191ca1cf0cd31a5bb13310be828d94170e57441"

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
