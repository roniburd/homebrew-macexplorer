cask "macexplorer@beta" do
  version "0.2.0-beta.7"
  sha256 "1fba387dc54c730ffde966f399dc15c13c81b9ef68c6c2d977ccfe92d244e891"

  url "https://github.com/roniburd/macExplorer/releases/download/v0.2.0-beta.7/MacExplorer-0.2.0-beta.7.zip"
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
