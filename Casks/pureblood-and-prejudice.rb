cask "pureblood-and-prejudice" do
  arch arm: "arm64", intel: "x64"

  version "0.3.3"
  sha256 arm:   "68d021fe50b6272ac59a9923013745a17172c2e5e6c8af0459686566dbdb233c",
         intel: "06ceb3f15f430af7c79d22f273d7f67af214331ac80e7dbe1c27c6a7812ccebc"

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
