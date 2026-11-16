cask "macexplorer" do
  version "0.11.0"
  sha256 "1970e2f3d40760a5d5cd5b30c1fb19aa01cc352905d6b897b0c607cf2e02fdd1"

  url "https://github.com/roniburd/macExplorer/releases/download/v0.11.0/MacExplorer-0.11.0.zip"
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
