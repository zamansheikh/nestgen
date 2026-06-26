<h1 align="center">🪺 nestgen</h1>

<p align="center">
  <b>A rich, interactive CLI that scaffolds a Flutter project with a production-ready
  Clean Architecture or MVC structure — in seconds.</b>
</p>

<p align="center">
  <a href="https://pub.dev/packages/nestgen"><img src="https://img.shields.io/pub/v/nestgen.svg?logo=dart&color=blue" alt="pub version"></a>
  <a href="https://pub.dev/packages/nestgen/score"><img src="https://img.shields.io/pub/points/nestgen?logo=dart&color=brightgreen" alt="pub points"></a>
  <a href="https://pub.dev/packages/nestgen"><img src="https://img.shields.io/pub/likes/nestgen?logo=dart" alt="pub likes"></a>
  <img src="https://img.shields.io/badge/platforms-windows%20%7C%20macos%20%7C%20linux-informational" alt="platforms">
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-Apache--2.0-purple.svg" alt="license"></a>
</p>

<p align="center">
  <a href="https://ko-fi.com/zamansheikh"><img src="https://img.shields.io/badge/Ko--fi-Support-FF5E5B?style=for-the-badge&logo=ko-fi&logoColor=white" alt="Ko-fi"></a>
  <a href="https://www.buymeacoffee.com/zamansheikh"><img src="https://img.shields.io/badge/Buy%20Me%20a%20Coffee-Support-FFDD00?style=for-the-badge&logo=buy-me-a-coffee&logoColor=black" alt="Buy Me a Coffee"></a>
</p>

---

## ✨ Features

- 🎛️ **Rich interactive terminal UI** — navigate every choice with **↑/↓ arrow keys**, with the recommended option preselected.
- 🏗️ **Two battle-tested architectures** — **Clean Architecture** (feature-first) and **MVC**.
- 🧩 **State management, wired for you** — **Riverpod, Bloc, Provider, GetX**, or **None**. Adds the dependency, runs `pub get`, and scaffolds a working example.
- 🧭 **Optional routing** — wire up [`go_router`](https://pub.dev/packages/go_router) with a ready `appRouter` (`MaterialApp.router`).
- 💉 **Optional dependency injection** — set up [`get_it`](https://pub.dev/packages/get_it) with a `setupLocator()` service locator called from `main()`.
- 🎨 **Optional theming** — light/dark `ThemeData` with `ThemeMode.system`.
- 🌍 **Optional localization (l10n)** — `flutter_localizations` + `intl`, `l10n.yaml`, ARB files, and codegen — all set up.
- 🏷️ **Smart project setup** — prompts for organization and shows the full package id (`com.example.my_app`).
- 🤖 **AI-ready** — generates an `AGENT_RULE.md` so AI assistants (Claude, Copilot, Cursor…) respect your architecture and avoid common mistakes.
- ✅ **Green out of the box** — replaces Flutter's default counter test so `flutter analyze` and `flutter test` pass immediately.
- 💻 **Cross-platform** — works the same on **Windows, macOS, and Linux**.
- 🔤 **Three aliases** — call it `nestgen`, `ngen`, or `nest`.

---

## 📦 Installation

nestgen is a global Dart command-line tool. Install it once:

```bash
dart pub global activate nestgen
```

That installs **three interchangeable commands** — `nestgen`, `ngen`, and `nest`.

> **Make sure the pub global bin directory is on your `PATH`.**

<details>
<summary><b>Windows</b></summary>

Add this to your `PATH` (System Environment Variables):

```
%LOCALAPPDATA%\Pub\Cache\bin
```
</details>

<details>
<summary><b>macOS / Linux</b></summary>

Add this to your `~/.zshrc`, `~/.bashrc`, or `~/.profile`:

```bash
export PATH="$PATH":"$HOME/.pub-cache/bin"
```
Then restart your terminal (or `source` the file).
</details>

### Local development (before publishing)

```bash
git clone https://github.com/zamansheikh/nestgen.git
cd nestgen
dart pub global activate --source path .
```

---

## 🚀 Usage

Just run it and follow the prompts:

```bash
nest
```

```text
   █▄░█ █▀▀ █▀▀ ▀█▀ █▀▀ █▀▀ █▄░█   v0.1.3
   █░▀█ ██▄ ▄▄█ ░█░ █▄█ ██▄ █░▀█
   Rich Flutter project scaffolder  ·  clean · mvc
   ───────────────────────────────────────────

? What would you like to do? (↑/↓ to move, enter to select)
❯ Create a new Flutter project
  Show help
  Exit

? Choose an architecture (↑/↓ to move, enter to select)
❯ Clean Architecture  —  Layered: data / domain / presentation, feature-first. (Recommended)
  MVC                 —  Models / Views / Controllers — simple and familiar.

? Choose state management (↑/↓ to move, enter to select)
  None      —  Plain setState — no extra dependency.
  Provider  —  ChangeNotifier + Provider. Simple and official.
❯ Riverpod  —  Compile-safe, testable. (Recommended)
  Bloc      —  Event-driven flutter_bloc with predictable states.
  GetX      —  Reactive controllers + routing in one package.
```

### Scripted / non-interactive

Any flag you provide skips its prompt — perfect for CI or quick scaffolding:

```bash
# Clean Architecture + Riverpod, with theme & localization
nestgen create my_app --arch clean --state riverpod --org com.acme --theme --l10n

# MVC + Bloc, no theme, no localization
nestgen create shop_app --arch mvc --state bloc --no-theme --no-l10n

# Scaffold folders only (don't run `flutter create`)
nestgen create my_app --arch clean --no-flutter-create
```

### Options

| Flag | Description |
|------|-------------|
| `-a, --arch` | `clean` or `mvc`. Omit to choose interactively. |
| `-s, --state` | `none`, `provider`, `riverpod`, `bloc`, or `getx`. |
| `-f, --feature` | First feature name (Clean Architecture only). Default `home`. |
| `--org` | Organization (reverse-domain), e.g. `com.example`. |
| `--[no-]router` | Use `go_router` for navigation. |
| `--[no-]di` | Add dependency injection with `get_it`. |
| `--[no-]theme` | Add a light/dark theme setup. |
| `--[no-]l10n` | Enable localization (multi-language). |
| `--no-flutter-create` | Scaffold folders only; don't run `flutter create`. |
| `--version` | Print the version. |

---

## 🗂️ Generated structure

### Clean Architecture (feature-first)

```text
lib/
├── core/                  # shared: errors, usecases, network, constants, utils
├── config/                # routes, theme
├── features/
│   └── <feature>/
│       ├── data/          # datasources, models, repositories (impl)
│       ├── domain/        # entities, repositories (abstract), usecases
│       └── presentation/  # pages, widgets, + state (bloc / providers / controllers)
├── l10n/                  # ARB files (if localization enabled)
└── main.dart
```

### MVC

```text
lib/
├── models/
├── views/
├── controllers/           # also holds the chosen state manager
├── services/
├── routes/
├── theme/                 # (if theme enabled)
├── utils/
└── main.dart
```

---

## 🧩 State management

Pick one and nestgen does the rest — adds the dependency, runs `flutter pub get`,
scaffolds a working counter example in the correct layer, and wires `main.dart`
(`ProviderScope` for Riverpod, `GetMaterialApp` for GetX, and so on).

| Option | Package | Added version |
|--------|---------|---------------|
| Provider | [`provider`](https://pub.dev/packages/provider) | `^6.1.5` |
| Riverpod | [`flutter_riverpod`](https://pub.dev/packages/flutter_riverpod) | `^3.3.2` |
| Bloc | [`flutter_bloc`](https://pub.dev/packages/flutter_bloc) | `^9.1.1` |
| GetX | [`get`](https://pub.dev/packages/get) | `^4.7.3` |
| None | — | — |

---

## 🗺️ Roadmap

- [ ] `nestgen feature <name>` — add a feature to an existing project.
- [ ] Custom template overrides.

Have an idea? [Open an issue](https://github.com/zamansheikh/nestgen/issues).

---

## 🤝 Contributing

Contributions are welcome! Fork the repo, create a branch, and open a pull request.
Please run `dart analyze` and `dart test` before submitting.

---

## ❤️ Support

If nestgen saves you time, consider supporting its development — it genuinely helps!

<p align="center">
  <a href="https://ko-fi.com/zamansheikh"><img src="https://img.shields.io/badge/Ko--fi-Buy%20me%20a%20coffee-FF5E5B?style=for-the-badge&logo=ko-fi&logoColor=white" alt="Ko-fi"></a>
  &nbsp;
  <a href="https://www.buymeacoffee.com/zamansheikh"><img src="https://img.shields.io/badge/Buy%20Me%20a%20Coffee-Donate-FFDD00?style=for-the-badge&logo=buy-me-a-coffee&logoColor=black" alt="Buy Me a Coffee"></a>
</p>

- ☕ **Buy Me a Coffee:** https://www.buymeacoffee.com/zamansheikh
- 💜 **Ko-fi:** https://ko-fi.com/zamansheikh
- ⭐ **Star the repo** on [GitHub](https://github.com/zamansheikh/nestgen) — it means a lot!

---

## 👤 Author

**Zaman Sheikh**
GitHub: [@zamansheikh](https://github.com/zamansheikh)

---

## 📄 License

Released under the **[Apache License 2.0](LICENSE)**. © 2026 Zaman Sheikh.

You are free to use and build on nestgen, but the license requires you to:

- **keep attribution** — retain the copyright, license, and [`NOTICE`](NOTICE) notices;
- **state your changes** — mark any files you modify; and
- **not rebrand it as your own** — the `nestgen` name and the author's name may
  not be used to endorse or promote derived products without written permission
  (Apache-2.0 §6, Trademarks).

In short: fork it, improve it, ship it — just don't strip the credit or pass it
off as your own work.
