import '../generators/architecture.dart';
import '../generators/state_management.dart';

/// All the user choices collected for a new project.
class ProjectConfig {
  const ProjectConfig({
    required this.projectName,
    required this.org,
    required this.architecture,
    required this.feature,
    required this.stateManagement,
    required this.enableL10n,
    required this.enableTheme,
    required this.enableDi,
    required this.useGoRouter,
  });

  final String projectName;
  final String org;
  final Architecture architecture;
  final String feature;
  final StateManagement stateManagement;
  final bool enableL10n;
  final bool enableTheme;

  /// Dependency injection via `get_it`.
  final bool enableDi;

  /// Navigation via `go_router` (instead of the Navigator routes map).
  final bool useGoRouter;

  /// Full application package / bundle identifier, e.g. `com.example.my_app`.
  String get packageId => '$org.$projectName';
}
