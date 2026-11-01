cask "convertion" do
  version "1.8"
  sha256 "593f91c0a834f26cd147d7b3c15d34bb3f803915eb36814ca1932db376d733c7"

  url "https://convertion.app/releases/Convertion-#{version}.zip"
  name "Convertion"
  desc "Convert and compress images, video, audio and PDFs from the Finder"
  homepage "https://convertion.app/"

  livecheck do
    url "https://convertion.app/version.json"
    strategy :json do |json|
      json["version"]
    end
  end

  depends_on macos: :sonoma

  app "Convertion.app"

  zap trash: [
    "~/Library/Caches/com.studiogusto.Convertion",
    "~/Library/Containers/com.studiogusto.Convertion.Finder",
    "~/Library/HTTPStorages/com.studiogusto.Convertion",
    "~/Library/Preferences/com.studiogusto.Convertion.plist",
  ]

  caveats <<~EOS
    To add Convertion to the Finder's right-click menu, open the app once, then
    turn it on in System Settings → General → Extensions → Convertion (ⓘ) →
    File Providers.
  EOS
end
