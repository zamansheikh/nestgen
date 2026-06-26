import 'dart:io';

import 'package:path/path.dart' as p;

/// Patches a freshly-generated `pubspec.yaml` to enable localization:
/// adds `flutter_localizations` + `intl` deps and `flutter: generate: true`.
class PubspecPatcher {
  /// Returns true if the file was changed.
  static bool enableL10n(String projectPath) {
    final file = File(p.join(projectPath, 'pubspec.yaml'));
    if (!file.existsSync()) return false;

    var content = file.readAsStringSync();
    var changed = false;

    // 1. Add localization dependencies right after the Flutter SDK dep.
    if (!content.contains('flutter_localizations:')) {
      final depAnchor = RegExp(r'dependencies:\s*\r?\n\s+flutter:\s*\r?\n\s+sdk:\s*flutter');
      final match = depAnchor.firstMatch(content);
      if (match != null) {
        const additions = '\n  flutter_localizations:\n'
            '    sdk: flutter\n'
            '  intl: any';
        content = content.replaceRange(match.end, match.end, additions);
        changed = true;
      }
    }

    // 2. Add `generate: true` under the top-level `flutter:` section.
    if (!RegExp(r'^\s+generate:\s*true', multiLine: true).hasMatch(content)) {
      final flutterSection = RegExp(r'^flutter:\s*$', multiLine: true);
      final match = flutterSection.firstMatch(content);
      if (match != null) {
        content = content.replaceRange(match.end, match.end, '\n  generate: true');
        changed = true;
      }
    }

    if (changed) file.writeAsStringSync(content);
    return changed;
  }
}
