# nestgen examples

## Command line (the usual way)

Install once, then any of the three aliases work:

```bash
dart pub global activate nestgen

nestgen        # interactive: walks you through every option
ngen create my_app --arch mvc --state provider
nest create shop_app --arch clean --state riverpod --theme --l10n
```

Common flags:

```bash
# Clean Architecture + Bloc, organization com.acme
nestgen create my_app --arch clean --state bloc --org com.acme

# MVC + GetX, no theme, no localization
nestgen create my_app --arch mvc --state getx --no-theme --no-l10n

# Scaffold folders only (don't run `flutter create`)
nestgen create my_app --arch clean --no-flutter-create
```

## Programmatic

You can also call the runner from Dart — see [main.dart](main.dart):

```dart
import 'package:nestgen/nestgen.dart';

Future<void> main() async {
  await NestgenCommandRunner().run([
    'create', 'my_app', '--arch', 'clean', '--state', 'riverpod',
    '--no-flutter-create',
  ]);
}
```
