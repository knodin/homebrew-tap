# Homebrew tap for Reckon Graph

This repository is the public Homebrew distribution channel for
[Reckon Graph](https://www.npmjs.com/package/reckon-graph), a local
code-intelligence CLI and single-tool MCP gateway. It contains the Homebrew
formula and release-verification automation, not the Reckon Graph source code.

## Install

Homebrew installs the required Node.js runtime. Bun is not required.

```bash
brew tap reckon-graph/tap
brew install reckon
reckon --version
```

Then initialize an existing Git checkout:

```bash
cd /path/to/repository
reckon init
```

Interactive `reckon init` asks whether agent integration should be personal,
team-shared, or CLI-only. To make the choice explicit:

```bash
reckon init --scope personal
```

Personal scope informs supported local coding agents without adding tracked
project instructions. Run `reckon status --deep` after initialization to
verify graph, hook, and agent-integration health.

## Upgrade or remove

```bash
brew update
brew upgrade reckon
```

```bash
brew uninstall reckon
brew untap reckon-graph/tap
```

## Supply-chain checks

The formula installs the exact public npm tarball identified by its SHA-256 and
disables dependency lifecycle scripts. CI independently verifies:

- the formula URL version equals the package version;
- the downloaded tarball equals the checked-in SHA-256;
- Homebrew style and strict audit;
- a clean formula installation;
- the installed `reckon --version`;
- an MCP initialize handshake whose tool list contains exactly one `reckon`
  gateway.

## Updating the formula

Publish the npm version first, then run the `Update Reckon Graph formula`
workflow with that exact version. The workflow verifies the public tarball and
opens a pull request; the audit workflow must pass before merging.

Do not add tokens, private registry URLs, internal hostnames, or local
filesystem paths to this repository.
