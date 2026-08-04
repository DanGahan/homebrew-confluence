# homebrew-confluence

Homebrew tap for [Confluence](https://github.com/DanGahan/confluence), a native
macOS Bluesky + Mastodon feed.

## Install

```sh
brew tap DanGahan/confluence
brew install --cask --no-quarantine confluence          # prod (latest)
brew install --cask --no-quarantine confluence@dev       # dev prerelease track
```

`--no-quarantine` is required: Confluence is ad-hoc signed, not notarised, so
without it Gatekeeper blocks first launch and you'd have to approve the app in
**System Settings → Privacy & Security**. The flag skips Gatekeeper's malware
check for this app.

## How it stays current

`.github/workflows/update-casks.yml` polls the confluence repo hourly, reads the
latest prod release and newest dev prerelease, recomputes each `sha256`, and
commits the cask update. No manual bumping. Run it on demand from the Actions
tab (**Update casks → Run workflow**).
