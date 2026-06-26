# arch_gen examples

## Command line (the usual way)

Install once, then any of the three aliases work:

```bash
dart pub global activate arch_gen

arch_gen        # interactive: walks you through every option
archgen create my_app --arch mvc --state provider
agen create shop_app --arch clean --state riverpod --theme --l10n
```

Common flags:

```bash
# Clean Architecture + Bloc, organization com.acme
arch_gen create my_app --arch clean --state bloc --org com.acme

# MVC + GetX, no theme, no localization
arch_gen create my_app --arch mvc --state getx --no-theme --no-l10n

# Scaffold folders only (don't run `flutter create`)
arch_gen create my_app --arch clean --no-flutter-create
```

## Programmatic

You can also call the runner from Dart — see [main.dart](main.dart):

```dart
import 'package:arch_gen/arch_gen.dart';

Future<void> main() async {
  await ArchGenCommandRunner().run([
    'create', 'my_app', '--arch', 'clean', '--state', 'riverpod',
    '--no-flutter-create',
  ]);
}
```
