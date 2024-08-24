import '/core/app_export.dart';

class Preference {
  /// Helper function to convert nested maps
  static Map<String, dynamic> _convertNestedMap(Map<dynamic, dynamic> map) {
    return Map<String, dynamic>.fromEntries(
      map.entries.map((entry) {
        if (entry.value is Map) {
          return MapEntry(entry.key.toString(), _convertNestedMap(entry.value));
        } else if (entry.value is List) {
          return MapEntry(entry.key.toString(), _convertList(entry.value));
        } else {
          return MapEntry(entry.key.toString(), entry.value);
        }
      }),
    );
  }

  /// Helper function to convert lists with potential nested maps
  static List<dynamic> _convertList(List<dynamic> list) {
    return list.map((element) {
      if (element is Map) {
        return _convertNestedMap(element);
      } else {
        return element;
      }
    }).toList();
  }

  /// Convert to Map<String, dynamic>
  static Map<String, dynamic> convert(data) {
    return Map<String, dynamic>.fromEntries(
      (data as Map).entries.map((entry) {
        if (entry.value is Map) {
          // Convert nested maps
          return MapEntry(entry.key.toString(), _convertNestedMap(entry.value));
        } else if (entry.value is List) {
          // Convert lists with potential nested maps
          return MapEntry(entry.key.toString(), _convertList(entry.value));
        } else {
          return MapEntry(entry.key.toString(), entry.value);
        }
      }),
    );
  }

  static Box get box => Hive.box(HiveBox.preference);
}
