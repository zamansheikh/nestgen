/// The architecture styles supported by arch_gen.
enum Architecture {
  clean(
    id: 'clean',
    label: 'Clean Architecture',
    description: 'Layered: data / domain / presentation, feature-first. (Recommended)',
  ),
  mvc(
    id: 'mvc',
    label: 'MVC',
    description: 'Models / Views / Controllers — simple and familiar.',
  );

  const Architecture({
    required this.id,
    required this.label,
    required this.description,
  });

  final String id;
  final String label;
  final String description;

  /// Label shown in the interactive picker, e.g. used by mason_logger.
  String get menuLabel => '$label  —  $description';

  static Architecture? fromId(String id) {
    for (final a in Architecture.values) {
      if (a.id == id.toLowerCase()) return a;
    }
    return null;
  }
}
