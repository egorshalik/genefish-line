import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/models.dart';

class IsarService {
  static late Isar _isar;

  static Isar get instance => _isar;

  static Future<void> open() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [LineSchema, FishSchema, LitterSchema],
      directory: dir.path,
    );
  }
}