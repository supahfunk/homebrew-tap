cask "convertion" do
  version "1.9"
  sha256 "bf3d767ca52aa8a1fbd1ea24b98b1a94758097ba0e80226179b84cf5a59521d7"

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
