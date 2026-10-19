import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'models/models.dart';
import 'screens/line_list_screen.dart';

/// Глобальный инстанс Isar.
/// Импортируется из экранов через `import '../main.dart';`.
late Isar isar;

Future<void> main() async {
  // Нужно, чтобы работали плагины (path_provider) до runApp.
  WidgetsFlutterBinding.ensureInitialized();

  // Открываем Isar в папке документов приложения.
  final dir = await getApplicationDocumentsDirectory();
  isar = await Isar.open(
    [LineSchema, FishSchema, LitterSchema, TraitSchema],
    directory: dir.path,
    name: 'isar_db', // можно не указывать, но полезно для ясности
  );

  Future<void> _seedDefaultTraits(Isar isar) async {
    final count = await isar.traits.count();
    if (count > 0) return;

    const defaults = [
      'Веер',
      'Круглый хвост',
      'Меч',
      'Неон',
      'Кобра',
      'Смокинг',
      'Солид',
    ];

    final traits = [
      for (var i = 0; i < defaults.length; i++)
        Trait()
          ..name = defaults[i]
          ..isBuiltIn = true
          ..sortOrder = i,
    ];

    await isar.writeTxn(() async {
      await isar.traits.putAll(traits);
    });
  }
  
  await _seedDefaultTraits(isar);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gene Lottery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6750A4), // можно взять любой
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6750A4),
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const LineListScreen(),
    );
  }
}