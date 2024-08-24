import 'package:flutter/material.dart';
import '/core/app_export.dart';

/// A provider class that manages connectivity state and notifies listeners of changes.
///
/// This class listens for changes in connectivity status and updates the `connected`
/// state accordingly. It also provides a method to check the current connectivity status.
class ConnectivityProvider with ChangeNotifier {
  /// The BuildContext used to access other providers.
  final BuildContext context;

  /// The [Connectivity] instance used to listen for connectivity changes.
  Connectivity connectivity = Connectivity();

  /// A boolean indicating whether the device is currently connected to the internet.
  bool connected = false;

  /// Creates an instance of [ConnectivityProvider].
  ///
  /// Initializes the [connectivity] instance and starts listening for connectivity changes.
  ConnectivityProvider(this.context) {
    connectivity.onConnectivityChanged.listen(listen);
  }

  /// Gets the current stack trace for debugging purposes.
  ///
  /// Parses the stack trace to extract the class and method names of the
  /// caller, providing a more readable format for error logging.
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

  /// Listens for changes in connectivity status and updates the [connected] state.
  ///
  /// [result] - A list of [ConnectivityResult] indicating the current connectivity status.
  void listen(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.mobile) ||
        result.contains(ConnectivityResult.wifi) ||
        result.contains(ConnectivityResult.ethernet) ||
        result.contains(ConnectivityResult.vpn) ||
        result.contains(ConnectivityResult.bluetooth) ||
        result.contains(ConnectivityResult.other)) {
      connected = true;
    } else if (result.contains(ConnectivityResult.none)) {
      connected = false;
    } else {
      connected = false;
    }
    notifyListeners();
  }

  /// Checks whether the device is currently connected to the internet.
  ///
  /// Throws a [NoInternetException] if the device is not connected.
  ///
  /// Returns `true` if the device is connected; otherwise, `false`.
  bool get isConnected {
    try {
      if (connected) {
        return connected;
      } else {
        throw NoInternetException();
      }
    } catch (error) {
      console.error(error, trace);
      rethrow;
    }
  }
}
