cask "usual-bot" do
  version "0.2.0"
  sha256 "f973e48084c087cd55cdcf53882176d267fdc006b0c9fddcef7e8b286e9e8eea"

  url "https://github.com/usual-labs/usual-bot/releases/download/v#{version}/UsualBot-#{version}.dmg"
  name "Usual Bot"
  desc "Messenger for Hermes Agent bots"
  homepage "https://github.com/usual-labs/usual-bot"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "UsualBot.app"

  zap trash: [
    "~/Library/Application Scripts/labs.usual.UsualBot",
    "~/Library/Containers/labs.usual.UsualBot",
  ]
end
