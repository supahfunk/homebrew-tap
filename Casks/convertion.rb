cask "convertion" do
  version "1.8.1"
  sha256 "d51a5ac6a72661a82aca2103791aa1193efca0468ac6360cd6e3bcfb03b37b3e"

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
