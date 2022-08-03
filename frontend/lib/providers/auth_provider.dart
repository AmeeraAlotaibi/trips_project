import 'dart:io';
import 'package:flutter/material.dart';
import 'package:frontend/models/user.dart';
import 'package:frontend/services/auth_service.dart';
import 'package:frontend/services/client.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  late String token;
  late User user;

  // register
  Future<void> register({required User user}) async {
    token = await AuthService().register(user: user);
    await setToken(token);
    print("REGISTER TOKEN::: ${token}");
    notifyListeners();
  }

  // sign in
  Future<void> signin({required User user}) async {
    token = await AuthService().signin(user: user);
    await setToken(token);
    print("SIGNIN TOKEN::: ${token}");
    notifyListeners();
  }

  // logout
  void logout() {
    token = "";
    print("Logged out");
    notifyListeners();
  }

  Future<void> setToken(String token) async {
    print("before ${token}");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("First: ${token}");
    prefs.setString("token", token);
    Client.dio.options.headers = {
      HttpHeaders.authorizationHeader: 'Bearer $token',
    };
    print("last: ${token}");
    notifyListeners();
  }
}
