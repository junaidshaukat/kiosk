import '/core/app_export.dart';

class HiveBox {
  static String preference = 'preference';

  static Future<void> initHive() async {
    await Hive.openBox(preference);
  }
}
