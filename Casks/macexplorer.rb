cask "macexplorer" do
  version "0.5.0"
  sha256 "0fd0527edebaba1c5f2a3e3e7029590b0af4db647b329e3fb8565b43807a29ed"

  url "https://github.com/roniburd/macExplorer/releases/download/v0.5.0/MacExplorer-0.5.0.zip"
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
