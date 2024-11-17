import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:pasopacifco_mobile/main.dart';

final GlobalKey<ScaffoldMessengerState> globalMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

abstract class NetworkInfo {
  Future<bool> get isConnected;

  Future<List<ConnectivityResult>> get connectionResult;
  Stream<List<ConnectivityResult>> get onConnectivityChanged;
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

  static final NetworkInfoImpl _networkInfo =
      NetworkInfoImpl._internal(Connectivity());

  factory NetworkInfoImpl() {
    return _networkInfo;
  }

  NetworkInfoImpl._internal(this.connectivity);

  @override
  Future<bool> get isConnected async {
    final result = await connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }

  @override
  Future<List<ConnectivityResult>> get connectionResult async {
    return await connectivity.checkConnectivity();
  }

  @override
  Stream<List<ConnectivityResult>> get onConnectivityChanged =>
      connectivity.onConnectivityChanged;
}

abstract class Failure {}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class NetworkFailure extends Failure {}

class ServerException implements Exception {}

class CacheException implements Exception {}

class NetworkException implements Exception {}

class NoInternetException implements Exception {
  late String _message;
  NoInternetException([String message = 'NoInternetException Occurred']) {
    if (globalMessengerKey.currentState != null) {
      globalMessengerKey.currentState!
          .showSnackBar(SnackBar(content: Text(message)));
      if (globalMessengerKey.currentState != null) {
        globalMessengerKey.currentState!
            .showSnackBar(SnackBar(content: Text(message)));
      }
    }

    @override
    String toString() {
      return _message;
    }
  }
}
