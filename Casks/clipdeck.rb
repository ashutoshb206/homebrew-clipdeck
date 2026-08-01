cask "clipdeck" do
  version "1.2.6"
  sha256 "650eceb1a8fde718903609d1de920dc6441b97d12b633291a01232473feb1ba1"

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
