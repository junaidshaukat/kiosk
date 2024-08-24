import '/core/app_export.dart';

abstract class NetworkInfoI {
  Future<bool> isConnected();
  Future<List<ConnectivityResult>> get connectivityResult;
  Stream<List<ConnectivityResult>> get onConnectivityChanged;
}

class NetworkInfo implements NetworkInfoI {
  Connectivity connectivity;
  static final NetworkInfo _networkInfo = NetworkInfo._internal(Connectivity());
  factory NetworkInfo() {
    return _networkInfo;
  }
  NetworkInfo._internal(this.connectivity) {
    connectivity = connectivity;
  }

  ///checks internet is connected or not
  ///returns [true] if internet is connected
  ///else it will return [false]
  @override
  Future<bool> isConnected() async {
    final result = await connectivity.checkConnectivity();
    if (result.contains(ConnectivityResult.mobile)) {
      return true;
    } else if (result.contains(ConnectivityResult.wifi)) {
      return true;
    } else if (result.contains(ConnectivityResult.ethernet)) {
      return true;
    } else if (result.contains(ConnectivityResult.vpn)) {
      return true;
    } else if (result.contains(ConnectivityResult.bluetooth)) {
      return true;
    } else if (result.contains(ConnectivityResult.other)) {
      return true;
    } else if (result.contains(ConnectivityResult.none)) {
      return true;
    }

    return false;
  }

  // to check type of internet connectivity
  @override
  Future<List<ConnectivityResult>> get connectivityResult async {
    return connectivity.checkConnectivity();
  }

  //check the type on internet connection on changed of internet connection
  @override
  Stream<List<ConnectivityResult>> get onConnectivityChanged =>
      connectivity.onConnectivityChanged;
}

abstract class Failure {}

// General failures
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class NetworkFailure extends Failure {}

class ServerException implements Exception {}

class CacheException implements Exception {}

class NetworkException implements Exception {}

///can be used for throwing [NoInternetException]
class NoInternetException implements Exception {
  late String _message;
  NoInternetException([String message = 'NoInternetException Occurred']) {
    _message = message;
  }
  @override
  String toString() {
    return _message;
  }
}
