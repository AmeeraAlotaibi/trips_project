import 'package:dio/dio.dart';
import 'package:frontend/services/client.dart';
import '../models/user.dart';

class AuthService {
  // REGISTER SERVICE ================================
  Future<String> register({required User user}) async {
    late String token = "";

    try {
      Response res = await Client.dio.post(
        "register/",
        data: user.toJson(),
      );
      print(res);
      // token = res.data["token"];
    } on DioError catch (error) {
      print(error.message);
    }
    return token;
  }

// SIGN IN SERVICE ================================
  Future<String> signin({required User user}) async {
    late String token = "";

    try {
      Response res = await Client.dio.post(
        "login/",
        data: user.toJson(),
      );
      print(res);
      // token = res.data["token"];
    } on DioError catch (error) {
      print(error);
    }
    return token;
  }
}
