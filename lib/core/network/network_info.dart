import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get statusConnection;
}

class NetworkInfoImb extends NetworkInfo {
  final InternetConnectionChecker internetConnectionChecker;
  NetworkInfoImb(this.internetConnectionChecker);
  @override
  get statusConnection => internetConnectionChecker.hasConnection;
}
