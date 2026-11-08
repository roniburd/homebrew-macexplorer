cask "macexplorer@beta" do
  version "0.2.0-beta.21"
  sha256 "7b8fe3671629364afb0b98e647fddc638cd010a1e88c548e5a23f460cd84f03c"

  url "https://github.com/roniburd/macExplorer/releases/download/v0.2.0-beta.21/MacExplorer-0.2.0-beta.21.zip"
  name "MacExplorer (Beta)"
  desc "Windows Explorer-style file manager"
  homepage "https://github.com/roniburd/macExplorer"

  auto_updates true
  conflicts_with cask: "macexplorer"
  depends_on macos: :tahoe

  app "MacExplorer.app"

  zap trash: [
    "~/Library/Application Support/macExplorer",
    "~/Library/Caches/com.macexplorer.app",
    "~/Library/Preferences/com.macexplorer.app.plist",
  ]

  caveats <<~EOS
    MacExplorer isn't notarized yet. If macOS says it can't be opened, run once:
      xattr -dr com.apple.quarantine "#{appdir}/MacExplorer.app"
    MacExplorer updates itself; `brew upgrade --greedy` also works.
  EOS
end
