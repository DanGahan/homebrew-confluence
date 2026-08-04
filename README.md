# homebrew-confluence

Homebrew tap for [Confluence](https://github.com/DanGahan/confluence), a native
macOS Bluesky + Mastodon feed.

## Install

```sh
brew tap DanGahan/confluence
brew install --cask confluence          # prod (latest)
brew install --cask confluence@dev       # dev prerelease track
```

Confluence is ad-hoc signed, not notarised, so macOS Gatekeeper blocks it on
first launch. Homebrew used to let you skip this with `--no-quarantine`, but
[that flag was removed](https://github.com/Homebrew/brew/issues/20755) as part
of its Gatekeeper-hardening. After installing, clear the quarantine flag once:

```sh
xattr -r -d com.apple.quarantine "/Applications/Confluence.app"
```

Or approve it in **System Settings → Privacy & Security → Open Anyway**.

> **Heads-up:** Homebrew is ending support for casks that fail Gatekeeper on
> 1 Sep 2026. The proper fix is notarising the app (Apple Developer ID), after
> which `brew install` needs no workaround. Tracked in
> [confluence#147](https://github.com/DanGahan/confluence/issues/147).

## How it stays current

`.github/workflows/update-casks.yml` polls the confluence repo hourly, reads the
latest prod release and newest dev prerelease, recomputes each `sha256`, and
commits the cask update. No manual bumping. Run it on demand from the Actions
tab (**Update casks → Run workflow**).
