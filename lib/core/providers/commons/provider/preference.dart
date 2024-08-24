import 'package:flutter/material.dart';
import '/core/app_export.dart';

class PreferenceProvider with ChangeNotifier {
  final BuildContext context;

  PreferenceProvider(this.context);

  String get trace {
    final stackTrace = StackTrace.current;
    final frames = stackTrace.toString().split('\n');

    if (frames.length > 1) {
      final callerFrame = frames[1].trim();
      final regex = RegExp(r'#\d+\s+(\S+)\.(\S+)\s+\(.*\)');
      final match = regex.firstMatch(callerFrame);

      if (match != null) {
        final className = match.group(1);
        final methodName = match.group(2);
        return "$className::$methodName";
      } else {
        return "$runtimeType::unknown";
      }
    } else {
      return "$runtimeType::unknown";
    }
  }

  Box get box => Hive.box(HiveBox.preference);

  Future<void> onReady() async {
    try {
      await packageInfo();
    } catch (error) {
      console.error(error, trace);
    }
  }

  String get baseUrl => 'https://donorapi.mervice.ca';

  String get version => box.get('version', defaultValue: '');

  /// Helper function to convert nested maps
  Map<String, dynamic> _convertNestedMap(Map<dynamic, dynamic> map) {
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
  List<dynamic> _convertList(List<dynamic> list) {
    return list.map((element) {
      if (element is Map) {
        return _convertNestedMap(element);
      } else {
        return element;
      }
    }).toList();
  }

  /// Convert to Map<String, dynamic>
  Map<String, dynamic> convert(data) {
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

  Future<bool> put(dynamic key, dynamic value) {
    return box.put(key, value).then((res) {
      return true;
    }, onError: (error) {
      console.error(error, trace);
      return false;
    });
  }

  Future<bool> putAll(Map<dynamic, dynamic> entries) {
    return box.putAll(entries).then((res) {
      return true;
    }, onError: (error) {
      console.error(error, trace);
      return false;
    });
  }

  Future<bool> clear() {
    return box.clear().then((res) {
      return packageInfo().then((res) {
        return res;
      }, onError: (error) {
        console.error(error, trace);
        return false;
      });
    }, onError: (error) {
      console.error(error, trace);
      return false;
    });
  }

  Future<bool> packageInfo() {
    return PackageInfo.fromPlatform().then((package) {
      return putAll({
        'appName': package.appName,
        'buildNumber': package.buildNumber,
        'buildSignature': package.buildSignature,
        'installerStore': package.installerStore,
        'packageName': package.packageName,
        'version': package.version,
      }).then((res) {
        return res;
      }, onError: (error) {
        console.error(error, trace);
        return false;
      });
    }, onError: (error) {
      console.error(error, trace);
      return false;
    });
  }
}
