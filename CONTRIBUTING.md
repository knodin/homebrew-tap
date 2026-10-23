# Contributing

Formula changes must reference a published HTTPS release artifact and its exact
SHA-256. Run these checks before opening a pull request:

```bash
scripts/verify-knodin-formula
bash -n scripts/verify-knodin-formula
bash -n scripts/update-knodin-formula
ruby -c Formula/knodin.rb
```

For a local Homebrew acceptance test:

```bash
brew tap knodin/tap "$(pwd)"
brew style Formula/knodin.rb
brew audit --strict knodin/tap/knodin
brew install --build-from-source knodin/tap/knodin
brew test knodin/tap/knodin
```

Never commit credentials, internal service names, private registry URLs, or
machine-local filesystem paths.

## Optional development attribution

This formula-only repository provides guarded shell hooks in `.githooks`.
For a clone without an existing hook manager, enable them with
`git config core.hooksPath .githooks`. If you already have hooks, merge the
guarded commands into your existing hook chain instead of replacing its checks.
The hooks do nothing when `aidev-track` is unavailable and forward Git's arguments
and input to the attribution tool.
