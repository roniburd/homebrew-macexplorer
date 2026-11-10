cask "macexplorer" do
  version "0.4.1"
  sha256 "9ddb3db9a5cf42dbbc20985790285c9b62ddc740c1dcdc37c06d3b95ca6aed22"

  url "https://github.com/roniburd/macExplorer/releases/download/v0.4.1/MacExplorer-0.4.1.zip"
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
