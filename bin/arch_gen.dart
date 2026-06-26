import 'dart:io';

import 'package:arch_gen/arch_gen.dart';

Future<void> main(List<String> args) async {
  final exitCode = await ArchGenCommandRunner().run(args);
  exit(exitCode);
}
