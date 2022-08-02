import 'package:dio/dio.dart';
import 'package:frontend/services/client.dart';
import '../models/user.dart';

class AuthService {
  
  Future<String> register({required User user}) async {
    
    late String token;
    
    try {
      Response res = await Client.dio.post("register", data: user);
      token = res.data["token"];
    } on DioError catch (error) {
      print(error);
    }
    return token;
  }
}
