cask "convertion" do
  version "1.7"
  sha256 "eb62bbdf8ef3047b7554fdf01c330f3149e582d5296f69784186b7883167765b"

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

  depends_on arch: :arm64
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
