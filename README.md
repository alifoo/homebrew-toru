# Toru for Mac — Homebrew tap

```sh
brew install --cask alifoo/toru/toru
```

[Toru](https://toru.tools) records product demo videos for your AI agent. Toru for Mac records the one window you
share (and, if you allow it, clicks and types in it for your agent). See https://toru.tools/mac.

The beta build is not notarized by Apple yet; the cask checks the download's SHA-256 and clears macOS's quarantine flag
so the app opens without a security prompt. Without Homebrew: `curl -fsSL https://toru.tools/install.sh | bash`.

Update with `brew upgrade --cask toru`. Uninstall with `brew uninstall --cask toru` (`--zap` also removes settings;
recordings in `~/Movies/Toru` are never removed).
