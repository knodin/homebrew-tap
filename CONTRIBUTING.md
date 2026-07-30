# Contributing

Formula changes must reference a published HTTPS release artifact and its exact
SHA-256. Run these checks before opening a pull request:

```bash
scripts/verify-reckon-graph-formula
bash -n scripts/verify-reckon-graph-formula
bash -n scripts/update-reckon-graph-formula
ruby -c Formula/reckon-graph.rb
```

For a local Homebrew acceptance test:

```bash
brew tap timpaulaskasds/tap "$(pwd)"
brew style Formula/reckon-graph.rb
brew audit --strict timpaulaskasds/tap/reckon-graph
brew install --build-from-source timpaulaskasds/tap/reckon-graph
brew test timpaulaskasds/tap/reckon-graph
```

Never commit credentials, internal service names, private registry URLs, or
machine-local filesystem paths.
