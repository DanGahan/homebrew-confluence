cask "confluence" do
  version "20260804"
  sha256 "95c8f9ae4778d48fd4e653a255a3448429c820ca51777ebed94fc2993d9d3547"

  url "https://github.com/DanGahan/confluence/releases/download/#{version}/Confluence-#{version}.zip"
  name "Confluence"
  desc "Combined Bluesky and Mastodon timeline"
  homepage "https://github.com/DanGahan/confluence"

  # Track only the "Latest" (non-prerelease) release — the prod track.
  # Follow the /releases/latest redirect and read the YYYYMMDD[-N] tag.
  livecheck do
    url "https://github.com/DanGahan/confluence/releases/latest"
    regex(%r{/tag/(\d{8}(?:-\d+)?)}i)
    strategy :page_match
  end

  depends_on macos: :tahoe

  app "Confluence.app"

  caveats <<~EOS
    Confluence is ad-hoc signed, not notarised, so Gatekeeper blocks it on
    first launch unless you install without quarantine:

      brew install --cask --no-quarantine confluence

    (--no-quarantine skips Gatekeeper's malware check for this app.)
  EOS
end
