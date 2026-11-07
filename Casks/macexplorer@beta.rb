cask "macexplorer@beta" do
  version "0.2.0-beta.10"
  sha256 "205f6b0fd65e0e86664da1f7ce67ca4d493ef5a4139bfb13c4cf6e4d97a772a6"

  url "https://github.com/roniburd/macExplorer/releases/download/v0.2.0-beta.10/MacExplorer-0.2.0-beta.10.zip"
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
