cask "convertion" do
  version "1.9.1"
  sha256 "fa8da5de1d5d331b39947f8384d01a29e95198dfeccb73b6f6bfffde1e7faf7b"

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
