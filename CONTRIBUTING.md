# Contributing

Formula changes must reference a published HTTPS release artifact and its exact
SHA-256. Run these checks before opening a pull request:

```bash
scripts/verify-reckon-graph-formula
bash -n scripts/verify-reckon-graph-formula
bash -n scripts/update-reckon-graph-formula
ruby -c Formula/reckon.rb
```

For a local Homebrew acceptance test:

```bash
brew tap reckon-graph/tap "$(pwd)"
brew style Formula/reckon.rb
brew audit --strict reckon-graph/tap/reckon
brew install --build-from-source reckon-graph/tap/reckon
brew test reckon-graph/tap/reckon
```

Never commit credentials, internal service names, private registry URLs, or
machine-local filesystem paths.
