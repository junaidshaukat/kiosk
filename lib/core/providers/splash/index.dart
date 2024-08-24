import 'package:flutter/material.dart';
import '/core/app_export.dart';

export 'models/export.dart';
export 'requests/export.dart';

class SplashProvider extends ChangeNotifier {
  final BuildContext context;

  late ApiProvider api;
  late PreferenceProvider preference;

  Props props = Props(data: [], initialData: []);

  SplashProvider(this.context) {
    preference = context.read<PreferenceProvider>();
    api = context.read<ApiProvider>();
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

  Future onReady() async {
    try {
      Future.delayed(const Duration(seconds: 5), () {
        NavigatorService.pushNamedAndRemoveUntil(
          AppRoutes.signin,
        );
      });
    } on NoInternetException catch (error) {
      console.error(error, trace);
      props.setError(currentError: error.message);
      notifyListeners();
    } on BiometricException catch (error) {
      console.error(error, trace);
      props.setError(currentError: error.message);
      notifyListeners();
    } on CustomException catch (error) {
      console.error(error, trace);
      props.setError(currentError: error.message);
      notifyListeners();
    } catch (error) {
      console.error(error, trace);
      props.setError(currentError: "$error");
      notifyListeners();
    }
  }
}
