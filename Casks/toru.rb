cask "toru" do
  version "0.4.2"
  sha256 "7cb1a3343b5d674cf310c5e70f01e581d4d6dee0aa4091cbcf8722d1630fd359"

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
