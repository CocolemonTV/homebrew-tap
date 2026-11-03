cask "pureblood-and-prejudice" do
  arch arm: "arm64", intel: "x64"

  version "0.3.3"
  sha256 arm:   "d6eada9d01e275c57c48f72e3360452ddfc523cc37da6e17e59a5040c40c7211",
         intel: "bfa5cdd9c2a5f2aafbafef40ddf8d21ba7d69b59c4c2bcbbf06ff5b914d1a13c"

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
