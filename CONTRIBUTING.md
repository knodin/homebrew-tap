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
