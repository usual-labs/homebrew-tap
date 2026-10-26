# usual-labs/homebrew-tap

The Homebrew tap for Usual Labs apps (`brew install --cask usual-labs/tap/usual-bot`). It holds one
cask, `Casks/usual-bot.rb`, which installs `UsualBot.app` from the `UsualBot-<version>.dmg` asset
of a [usual-labs/usual-bot](https://github.com/usual-labs/usual-bot) release. The app is signed,
notarized and sandboxed (bundle id `labs.usual.UsualBot`), so `zap` removes only its container.
Nothing updates the cask automatically.

Homebrew 7 loads casks from third-party taps only once they're trusted. Installing by the full
name (`usual-labs/tap/usual-bot`) trusts that one cask, which is why the README uses it; a short
`usual-bot` after a plain `brew tap` stops with an "untrusted tap" error.

## Bumping the cask after a release

1. Set `version`, and `sha256` from the release's `UsualBot-<version>.dmg.sha256` asset.
2. Check it from a local clone tapped with `brew tap usual-labs/tap <path to this clone>`:
   - `brew style usual-labs/tap`
   - `brew install --cask --appdir=<scratch folder> usual-labs/tap/usual-bot` (this also trusts
     the cask), then `spctl --assess -vv` on the installed app ("Notarized Developer ID") and
     `brew uninstall --cask usual-bot`. A scratch `--appdir` leaves `/Applications` alone. Never
     test `--zap`: it deletes the app's real data.
   - `brew audit --cask --strict --online usual-labs/tap/usual-bot`. It needs Command Line Tools
     as new as Xcode; with older ones it stops before auditing, and the same audit runs through
     `brew ruby` with `Cask::Auditor.audit(cask, audit_download: true, audit_online: true,
     audit_strict: true, audit_signing: true, any_named_args: true)` after
     `Utils::GemSetup.install_bundler_gems!(groups: ["audit", "ast"])`. Running it may tap
     `homebrew/core` (1.5 GB); `brew untap homebrew/core` afterwards.
   - `brew livecheck usual-labs/tap/usual-bot` should report the new version as current.
3. Commit as `usual-bot <version>`.
