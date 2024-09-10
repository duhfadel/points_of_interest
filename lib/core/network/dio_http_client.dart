import 'package:dio/dio.dart';

class DioHttpClient {
  //Note for who is correcting: I could use Http package, but I am using Dio because I am familiar and have some advanced features
  final Dio dio = Dio();

  DioHttpClient() {
    _setupDio();
  }

  void _setupDio() {
    dio.options.baseUrl = 'https://raw.githubusercontent.com/';
    dio.options.connectTimeout = const Duration(seconds: 15);
  }
}
