cask "macexplorer" do
  version "0.10.0"
  sha256 "94f8ebdb8e2317d31bf53d74be26d6079d7e6e7a5a0b7d9049c41a6bc82d269f"

  url "https://github.com/roniburd/macExplorer/releases/download/v0.10.0/MacExplorer-0.10.0.zip"
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
