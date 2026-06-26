// Example: drive nestgen programmatically through its public API.
//
// Normally you use the installed command line tool instead:
//
//   dart pub global activate nestgen
//   nestgen create my_app --arch clean --state riverpod
//
// (`ngen` and `nest` are installed as aliases for the same command.)
//
// The snippet below scaffolds the folder structure only (it skips
// `flutter create`) so it runs without the Flutter SDK present.
import 'package:nestgen/nestgen.dart';

Future<void> main() async {
  final exitCode = await NestgenCommandRunner().run([
    'create',
    'my_app',
    '--arch', 'clean',
    '--state', 'riverpod',
    '--org', 'com.example',
    '--theme',
    '--no-l10n',
    '--no-flutter-create',
  ]);

  print('nestgen exited with code: $exitCode');
}
