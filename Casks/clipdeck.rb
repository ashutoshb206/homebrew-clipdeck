cask "clipdeck" do
  version "1.2.7"
  sha256 "5c1b1f13eb1680238e251ab54c5b2aa20e91b5a44c1bb4ab26031fb27be3be83"

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
