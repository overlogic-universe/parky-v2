import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../failures/exception.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
  Future<T> safeNetworkRequest<T>({
    required Future<T> Function() result,
  });
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker _internetConnectionChecker;

  NetworkInfoImpl({
    required InternetConnectionChecker internetConnectionChecker,
  }) : _internetConnectionChecker = internetConnectionChecker;

  @override
  Future<bool> get isConnected => _internetConnectionChecker.hasConnection;

  @override
  Future<T> safeNetworkRequest<T>(
      {required Future<T> Function() result}) async {
    if (await isConnected) {
      return await result();
    } else {
      throw OfflineException();
    }
  }
}
