cask "toru" do
  version "0.4.0"
  sha256 "c067b4adf2f3e827cca982700efa0fdb03f56f1f6141833dbe52af4818c5bc4f"

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

  # The beta build is not notarized by Apple yet. Homebrew marks downloads as quarantined, which makes macOS refuse to
  # open the app; the download's SHA-256 is checked above, so the flag is cleared.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Toru.app"]
  end

  # Recordings in ~/Movies/Toru are the user's and are never removed.
  zap trash: [
    "~/Library/Caches/tools.toru.mac",
    "~/Library/HTTPStorages/tools.toru.mac",
    "~/Library/Preferences/tools.toru.mac.plist",
  ]
end
