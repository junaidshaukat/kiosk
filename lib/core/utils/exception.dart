import '/core/app_export.dart';

class NoInternetException implements Exception {
  late String _message;

  NoInternetException([String? message]) {
    _message = message?.tr ?? 'no_internet_connection'.tr;
  }

  String get message => _message;

  @override
  String toString() {
    return _message;
  }
}

class BiometricException implements Exception {
  late String _message;

  BiometricException([String? message]) {
    _message = message?.tr ?? 'no_internet_connection'.tr;
  }

  String get message => _message;

  @override
  String toString() {
    return _message;
  }
}

class UnauthorizedException implements Exception {
  late String _message;

  UnauthorizedException([String? message]) {
    _message = message?.tr ?? 'unauthorized'.tr;
  }

  String get message => _message;

  @override
  String toString() {
    return _message;
  }
}

class CustomException implements Exception {
  late String _message;
  CustomException([String? message]) {
    _message = message?.tr ?? 'something_went_wrong'.tr;
  }

  String get message => _message;

  @override
  String toString() {
    return _message;
  }
}
