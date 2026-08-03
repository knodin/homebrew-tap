# Homebrew tap for knodin

This repository is the public Homebrew distribution channel for
[knodin](https://www.npmjs.com/package/knodin), a local
code-intelligence CLI and single-tool MCP gateway. It contains the Homebrew
formula and release-verification automation, not the knodin source code.

## Install

Homebrew installs the required Node.js runtime. Bun is not required.

The recommended one-command installation automatically adds the tap and trusts
only the `knodin` formula:

```bash
brew install knodin/tap/knodin
knodin --version
```

Homebrew requires explicit trust before it will resolve a third-party formula
by its short name. If `brew install knodin` is required literally, configure
that trust first:

```bash
brew tap knodin/tap
brew trust --formula knodin/tap/knodin
brew install knodin
```

Then initialize an existing Git checkout:

```bash
cd /path/to/repository
knodin init
```

Interactive `knodin init` asks whether agent integration should be personal,
team-shared, or CLI-only. To make the choice explicit:

```bash
knodin init --scope personal
```

Personal scope informs supported local coding agents without adding tracked
project instructions. Run `knodin status --deep` after initialization to
verify graph, hook, and agent-integration health.

## Upgrade or remove

```bash
brew update
brew upgrade knodin
```

```bash
brew uninstall knodin
brew untap knodin/tap
```

## Supply-chain checks

The formula installs the exact public npm tarball identified by its SHA-256 and
disables dependency lifecycle scripts. CI independently verifies:

- the formula URL version equals the package version;
- the downloaded tarball equals the checked-in SHA-256;
- Homebrew style and strict audit;
- a clean formula installation;
- the installed `knodin --version`;
- an MCP initialize handshake whose tool list contains exactly one `knodin`
  gateway.

## Updating the formula

Publish the npm version first, then run the `Update knodin formula`
workflow with that exact version. The workflow verifies the public tarball and
opens a pull request; the audit workflow must pass before merging.

Do not add tokens, private registry URLs, internal hostnames, or local
filesystem paths to this repository.
