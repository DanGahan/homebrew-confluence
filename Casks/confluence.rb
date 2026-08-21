cask "confluence" do
  version "20260821"
  sha256 "35fdf93d0cda14ae2517827e0295bcb8e23e22dfdbe63264bdc8ab31d7e14f35"

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
    Confluence is ad-hoc signed, not notarised, so macOS Gatekeeper blocks it
    on first launch. Homebrew no longer skips quarantine (the --no-quarantine
    flag was removed), so clear it once after installing:

      xattr -r -d com.apple.quarantine "/Applications/Confluence.app"

    Or approve it in System Settings > Privacy & Security > Open Anyway.
  EOS
end
