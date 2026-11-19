cask "macexplorer" do
  version "0.12.0"
  sha256 "710a2262cb59381912190fad4436a6cdd6a3e3cc1dc2aeb43fe97eac64d079bd"

  url "https://github.com/roniburd/macExplorer/releases/download/v0.12.0/MacExplorer-0.12.0.zip"
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
