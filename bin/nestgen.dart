import 'dart:io';

import 'package:nestgen/nestgen.dart';

Future<void> main(List<String> args) async {
  final exitCode = await NestgenCommandRunner().run(args);
  exit(exitCode);
}
