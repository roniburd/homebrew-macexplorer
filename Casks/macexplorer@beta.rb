cask "macexplorer@beta" do
  version "0.2.0-beta.5"
  sha256 "4fbb5ef4516de75326927a9d7d0fd684cf8ef24f1b1e10cd62e0e6ebe89a423f"

  url "https://github.com/roniburd/macExplorer/releases/download/v0.2.0-beta.5/MacExplorer-0.2.0-beta.5.zip"
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
