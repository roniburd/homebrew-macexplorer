cask "macexplorer@beta" do
  version "0.2.0-beta.17"
  sha256 "57c937ce8410a36cadc1bc2571bf98e30d6191249fbaf071903bab7dcd2e2363"

  url "https://github.com/roniburd/macExplorer/releases/download/v0.2.0-beta.17/MacExplorer-0.2.0-beta.17.zip"
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
