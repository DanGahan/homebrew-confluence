cask "confluence@dev" do
  version "DEV_2608041815"
  sha256 "ada31f66c90a018fdd60a8baf12fe4825974efc45d03e150ea20d22ea3aabfa0"

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
    Dev builds are ad-hoc signed prereleases. Install without quarantine so
    Gatekeeper doesn't block first launch:

      brew install --cask --no-quarantine confluence@dev

    (--no-quarantine skips Gatekeeper's malware check for this app.)
  EOS
end
