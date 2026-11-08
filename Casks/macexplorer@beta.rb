cask "macexplorer@beta" do
  version "0.2.0-beta.18"
  sha256 "21e198e030aad6832a27ab0dcc84d8401ad3d9880dd7ac4f311c94493ec2ea0e"

  url "https://github.com/roniburd/macExplorer/releases/download/v0.2.0-beta.18/MacExplorer-0.2.0-beta.18.zip"
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
