import 'package:flutter/material.dart';
import 'package:frontend/models/user.dart';
import 'package:frontend/services/auth_service.dart';
import 'package:provider/provider.dart';

class AuthProvider extends ChangeNotifier {
  late String token;
  late User user;

  // register
  Future<void> register({required User user}) async {
    token = await AuthService().register(user: user);
    print("REGISTER TOKEN::: ${token}");
    notifyListeners();
  }

  // sign in
  Future<void> signin({required User user}) async {
    token = await AuthService().signin(user: user);
    print("SIGNIN TOKEN::: ${token}");
    notifyListeners();
  }

  // logout
  void logout() {
    token = "";
    print("Logged out");
    notifyListeners();
  }
}
