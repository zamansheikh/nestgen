# Changelog

## 0.2.0

- Three interchangeable commands installed together: `arch_gen`, `archgen`, `agen`.
- Interactive main menu when running `arch_gen` with no command.
- Prompt for organization and show the full package id (e.g. `com.example.my_app`).
- New menus: light/dark theme setup and localization (l10n) — with `--[no-]theme`
  and `--[no-]l10n` flags.
- Localization wiring: adds `flutter_localizations`/`intl`, `generate: true`,
  `l10n.yaml`, ARB files, and runs `flutter pub get` for codegen.
- Replaces the default counter `test/widget_test.dart` with a smoke test so
  `flutter analyze` and `flutter test` pass on a fresh project.

## 0.1.0

- Initial release.
- `arch_gen create` command with interactive, arrow-key architecture picker.
- Clean Architecture (feature-first) and MVC scaffolds.
- Runs `flutter create` and wires up the chosen architecture.
- Flags: `--arch`, `--feature`, `--org`, `--no-flutter-create`, `--version`.
