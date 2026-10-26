cask "usual-bot" do
  version "0.3.0"
  sha256 "1aa9de30c9160ddf16c1c5727115ed12511a1e0ed6d06de3d01517cfe4a71890"

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
