import '../models/project_config.dart';
import '../utils/scaffold.dart';
import '../utils/templates.dart';

/// Builds a classic MVC scaffold: models / views / controllers + helpers.
class MvcGenerator {
  ScaffoldPlan build(ProjectConfig config) {
    final directories = <String>[
      'lib/models',
      'lib/views/home',
      'lib/views/widgets',
      'lib/controllers',
      'lib/services',
      'lib/routes',
      'lib/utils',
      if (config.enableTheme) 'lib/theme',
      if (config.enableL10n) 'lib/l10n',
      'test',
    ];

    final files = <String, String>{
      'lib/utils/constants.dart': '''
class AppConstants {
  AppConstants._();

  static const String appName = '${config.projectName}';
}
''',
      'lib/models/item_model.dart': '''
class ItemModel {
  const ItemModel({required this.id, required this.title});

  final String id;
  final String title;

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'] as String,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() => {'id': id, 'title': title};
}
''',
      'lib/services/api_service.dart': '''
import '../models/item_model.dart';

/// Talks to your backend. Keep all I/O here, out of controllers.
class ApiService {
  Future<List<ItemModel>> fetchItems() async {
    // TODO: replace with a real API call.
    return const [
      ItemModel(id: '1', title: 'Hello from MVC'),
    ];
  }
}
''',
      'lib/controllers/home_controller.dart': '''
import 'package:flutter/foundation.dart';

import '../models/item_model.dart';
import '../services/api_service.dart';

/// Mediates between the view and the model/service layer.
class HomeController extends ChangeNotifier {
  HomeController({ApiService? api}) : _api = api ?? ApiService();

  final ApiService _api;

  bool _loading = false;
  bool get loading => _loading;

  List<ItemModel> _items = const [];
  List<ItemModel> get items => _items;

  Future<void> load() async {
    _loading = true;
    notifyListeners();
    _items = await _api.fetchItems();
    _loading = false;
    notifyListeners();
  }
}
''',
      'lib/views/home/home_view.dart': '''
import 'package:flutter/material.dart';

import '../../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController _controller = HomeController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onChange);
    _controller.load();
  }

  void _onChange() => setState(() {});

  @override
  void dispose() {
    _controller.removeListener(_onChange);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: _controller.loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                for (final item in _controller.items)
                  ListTile(title: Text(item.title)),
              ],
            ),
    );
  }
}
''',
      'lib/routes/app_routes.dart': '''
import 'package:flutter/material.dart';

import '../views/home/home_view.dart';

class AppRoutes {
  AppRoutes._();

  static const String home = '/';

  static Map<String, WidgetBuilder> get routes => {
        home: (_) => const HomeView(),
      };
}
''',
      'lib/main.dart': buildMainDart(
        config: config,
        routesImport: 'routes/app_routes.dart',
        constantsImport: 'utils/constants.dart',
        themeImport: 'theme/app_theme.dart',
        initialRouteExpr: 'AppRoutes.home',
        routesMapExpr: 'AppRoutes.routes',
      ),
      'test/widget_test.dart': buildWidgetTest(config),
      if (config.enableTheme) 'lib/theme/app_theme.dart': buildAppTheme(),
      if (config.enableL10n) ...buildL10nFiles(config),
    };

    return ScaffoldPlan(directories: directories, files: files);
  }
}
