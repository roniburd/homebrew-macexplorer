cask "macexplorer" do
  version "0.9.0"
  sha256 "53c950c73525781ae5eade1a68054f49086918d62cec75f9b88b1ca67c78011b"

  url "https://github.com/roniburd/macExplorer/releases/download/v0.9.0/MacExplorer-0.9.0.zip"
  name "MacExplorer"
  desc "Windows Explorer-style file manager"
  homepage "https://github.com/roniburd/macExplorer"

  auto_updates true
  conflicts_with cask: "macexplorer@beta"
  depends_on macos: :tahoe

  app "MacExplorer.app"

  zap trash: [
    "~/Library/Application Support/macExplorer",
    "~/Library/Caches/com.macexplorer.app",
    "~/Library/Caches/macExplorer",
    "~/Library/HTTPStorages/com.macexplorer.app",
    "~/Library/HTTPStorages/com.macexplorer.app.binarycookies",
    "~/Library/Preferences/com.macexplorer.app.plist",
    "~/Library/Saved Application State/com.macexplorer.app.savedState",
  ]

  caveats <<~EOS
    MacExplorer isn't notarized yet. If macOS says it can't be opened, run once:
      xattr -dr com.apple.quarantine "#{appdir}/MacExplorer.app"
    MacExplorer updates itself; `brew upgrade --greedy` also works.
  EOS
end
