cask "macexplorer" do
  version "0.4.0"
  sha256 "13e0a671dbbc5b28531988c2bcd794593d3fdee50d9393b290bcb14d35624666"

  url "https://github.com/roniburd/macExplorer/releases/download/v0.4.0/MacExplorer-0.4.0.zip"
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
