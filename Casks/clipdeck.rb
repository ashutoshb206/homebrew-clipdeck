cask "clipdeck" do
  version "1.0.3"
  sha256 "17005f8603b568acbb0e2f8f8ac7dfe78a37ad018211f89260139be26ff7a3c5"

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
