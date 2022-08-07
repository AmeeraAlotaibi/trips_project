import 'package:dio/dio.dart';

class Client {
  static final Dio dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:8000/"));
}
