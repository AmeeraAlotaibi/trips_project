import 'package:dio/dio.dart';

class Client {
  static final Dio dio = Dio(
    BaseOptions(baseUrl: "https://127.0.0.1:8000/")
  );

}
