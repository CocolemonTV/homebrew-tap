cask "pureblood-and-prejudice" do
  arch arm: "arm64", intel: "x64"

  version "0.3.1"
  sha256 arm:   "0e8b3f4b0ea2321f010080342b7514d822fc17093490b9a4aaeb9c80e763c63b",
         intel: "38442c1431ca4ac519afe8bd727721dbee1c59962d65e54cb176eb642f719d5a"

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
