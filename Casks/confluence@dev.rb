cask "confluence@dev" do
  version "DEV_2608211148"
  sha256 "4a0c71e43ec2196b0908e90fcfd4f2b19df52e02f35e3b5f618869144ab5ac27"

  url "https://github.com/DanGahan/confluence/releases/download/dev-#{version}/Confluence-#{version}.zip"
  name "Confluence (dev)"
  desc "Combined Bluesky and Mastodon timeline — dev prerelease track"
  homepage "https://github.com/DanGahan/confluence"

  # Dev track = newest prerelease (tag dev-DEV_YYMMDDHHMM). `brew audit` will
  # still flag this cask as pointing at a pre-release — that's intentional here.
  livecheck do
    url "https://github.com/DanGahan/confluence/releases"
    strategy :github_releases
    regex(/^dev-(DEV_\d+)$/i)
  end

  conflicts_with cask: "confluence"
  depends_on macos: :tahoe

  app "Confluence.app"

  caveats <<~EOS
    Dev builds are ad-hoc signed prereleases, not notarised, so Gatekeeper
    blocks them on first launch. Homebrew no longer skips quarantine, so clear
    it once after installing:

      xattr -r -d com.apple.quarantine "/Applications/Confluence.app"

    Or approve it in System Settings > Privacy & Security > Open Anyway.
  EOS
end
