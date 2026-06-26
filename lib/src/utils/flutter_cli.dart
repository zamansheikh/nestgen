import 'dart:io';

/// Thin wrapper around the `flutter` executable.
class FlutterCli {
  /// Returns true if `flutter` is on the PATH.
  static Future<bool> isInstalled() async {
    try {
      final result = await Process.run(
        'flutter',
        ['--version'],
        runInShell: true,
      );
      return result.exitCode == 0;
    } on ProcessException {
      return false;
    }
  }

  /// Runs `flutter create` for [projectName] in [workingDirectory], streaming
  /// output to the console. Returns the process exit code.
  static Future<int> create({
    required String projectName,
    required String workingDirectory,
    String? org,
    List<String> platforms = const [],
    String? description,
  }) async {
    final args = <String>['create'];
    if (org != null && org.isNotEmpty) args.addAll(['--org', org]);
    if (description != null && description.isNotEmpty) {
      args.addAll(['--description', description]);
    }
    if (platforms.isNotEmpty) {
      args.addAll(['--platforms', platforms.join(',')]);
    }
    args.add(projectName);

    final process = await Process.start(
      'flutter',
      args,
      workingDirectory: workingDirectory,
      runInShell: true,
      mode: ProcessStartMode.inheritStdio,
    );
    return process.exitCode;
  }

  /// Runs `flutter pub get` in [workingDirectory] (also triggers l10n codegen
  /// when `generate: true` is set). Output is captured, not streamed.
  static Future<int> pubGet(String workingDirectory) async {
    final result = await Process.run(
      'flutter',
      ['pub', 'get'],
      workingDirectory: workingDirectory,
      runInShell: true,
    );
    return result.exitCode;
  }
}
