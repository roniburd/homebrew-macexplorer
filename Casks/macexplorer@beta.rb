cask "macexplorer@beta" do
  version "0.2.0-beta.11"
  sha256 "da34d2b03623cac46e6ef33a59d4d1c9042ff1bf2a7efd3774e12e6cd278f8bf"

  url "https://github.com/roniburd/macExplorer/releases/download/v0.2.0-beta.11/MacExplorer-0.2.0-beta.11.zip"
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
