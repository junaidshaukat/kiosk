import 'package:flutter/material.dart';
import '/core/app_export.dart';

export 'models/export.dart';
export 'requests/export.dart';

class AuthenticationProvider extends ChangeNotifier {
  final BuildContext context;
  late ApiProvider api;
  late PreferenceProvider preference;

  Props props = Props();
  Props propsFogotPassword = Props();
  Props propsResetPassword = Props();

  AuthenticationProvider(this.context) {
    api = context.read<ApiProvider>();
    preference = context.read<PreferenceProvider>();
  }

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
}
