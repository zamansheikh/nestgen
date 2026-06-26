import 'dart:io';

import 'package:path/path.dart' as p;

/// A description of files/folders to create, produced by a generator and
/// written to disk by [Scaffold].
class ScaffoldPlan {
  ScaffoldPlan({this.directories = const [], this.files = const {}});

  /// Directories to create (relative to the project root).
  final List<String> directories;

  /// Files to create: relative path -> contents.
  final Map<String, String> files;
}

/// Writes a [ScaffoldPlan] to disk under [projectPath].
class Scaffold {
  Scaffold(this.projectPath);

  final String projectPath;

  /// Creates all directories and files. Existing files are left untouched
  /// unless [overwrite] is true. Returns the list of created paths.
  List<String> apply(ScaffoldPlan plan, {bool overwrite = false}) {
    final created = <String>[];

    for (final dir in plan.directories) {
      final fullPath = p.join(projectPath, p.normalize(dir));
      final directory = Directory(fullPath);
      if (!directory.existsSync()) {
        directory.createSync(recursive: true);
        created.add(p.relative(fullPath, from: projectPath));
      }
      // Drop a .gitkeep so empty folders survive in git.
      final gitkeep = File(p.join(fullPath, '.gitkeep'));
      if (!gitkeep.existsSync()) gitkeep.writeAsStringSync('');
    }

    plan.files.forEach((relPath, contents) {
      final fullPath = p.join(projectPath, p.normalize(relPath));
      final file = File(fullPath);
      if (file.existsSync() && !overwrite) return;
      file.parent.createSync(recursive: true);
      file.writeAsStringSync(contents);
      created.add(p.relative(fullPath, from: projectPath));
    });

    return created;
  }
}
