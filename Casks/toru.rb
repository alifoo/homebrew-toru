cask "toru" do
  version "0.4.3"
  sha256 "45c901ddf91edb8725f25cd22a701010afe1577a38a1f43c64df3ed061972ca5"

  url "https://toru.tools/downloads/mac/Toru-#{version}.zip"
  name "Toru"
  desc "Records product demos of native apps for your AI agent"
  homepage "https://toru.tools/mac"

  livecheck do
    url "https://toru.tools/downloads/mac.json"
    strategy :json do |json|
      json.dig("latest", "version")
    end
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Toru.app"

  # Recordings in ~/Movies/Toru are the user's and are never removed.
  zap trash: [
    "~/Library/Caches/tools.toru.mac",
    "~/Library/HTTPStorages/tools.toru.mac",
    "~/Library/Preferences/tools.toru.mac.plist",
  ]
end
