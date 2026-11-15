cask "macexplorer" do
  version "0.8.1"
  sha256 "4af562e4547cc5f9474e92bf7bdb6965228bb8424db8d2ac1bb8271dfac9b882"

  url "https://github.com/roniburd/macExplorer/releases/download/v0.8.1/MacExplorer-0.8.1.zip"
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
    "~/Library/Preferences/com.macexplorer.app.plist",
  ]

  caveats <<~EOS
    MacExplorer isn't notarized yet. If macOS says it can't be opened, run once:
      xattr -dr com.apple.quarantine "#{appdir}/MacExplorer.app"
    MacExplorer updates itself; `brew upgrade --greedy` also works.
  EOS
end
