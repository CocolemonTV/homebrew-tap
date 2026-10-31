cask "pureblood-and-prejudice" do
  arch arm: "arm64", intel: "x64"

  version "0.3.2"
  sha256 arm:   "45b5899cca87f8a5cc718cae9a1d749a20f6435a845ac512e95823da1e6a6529",
         intel: "3e70c1de2118c13670271ee7d897430d56dcf662fafdb0bc0ac0e0478aeac34c"

  url "https://github.com/CocolemonTV/pureblood-and-prejudice-releases/releases/download/v#{version}/Pureblood-and-Prejudice-#{version}-mac-#{arch}.dmg"
  name "Pureblood & Prejudice"
  desc "Unofficial fan visual novel set in a dark-academia wizarding school"
  homepage "https://github.com/CocolemonTV/pureblood-and-prejudice-releases"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "pureblood-and-prejudice.app", target: "Pureblood & Prejudice.app"

  zap trash: [
    "~/Library/Application Support/Pureblood-and-Prejudice",
    "~/Library/Preferences/dev.ruizukun.purebloodandprejudice.plist",
    "~/Library/Saved Application State/dev.ruizukun.purebloodandprejudice.savedState",
  ]

  caveats <<~EOS
    This app is not signed by Apple. On first launch macOS may say it
    "can't be opened". Right-click the app in Applications and choose Open,
    or allow it under System Settings > Privacy & Security.

    `brew uninstall --zap` also deletes your save files.
  EOS
end
