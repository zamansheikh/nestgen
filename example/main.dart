// Example: drive arch_gen programmatically through its public API.
//
// Normally you use the installed command line tool instead:
//
//   dart pub global activate arch_gen
//   arch_gen create my_app --arch clean --state riverpod
//
// (`archgen` and `agen` are installed as aliases for the same command.)
//
// The snippet below scaffolds the folder structure only (it skips
// `flutter create`) so it runs without the Flutter SDK present.
import 'package:arch_gen/arch_gen.dart';

Future<void> main() async {
  final exitCode = await ArchGenCommandRunner().run([
    'create',
    'my_app',
    '--arch', 'clean',
    '--state', 'riverpod',
    '--org', 'com.example',
    '--theme',
    '--no-l10n',
    '--no-flutter-create',
  ]);

  print('arch_gen exited with code: $exitCode');
}
