import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/login_page_model.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(LoginPageModel user) async {
    final result = user.result;

    final SharedPreferences sp = await SharedPreferences.getInstance();
    final toke = sp.setString("Token", result!.token.toString());
    print("my all new token $toke");
    notifyListeners();

    return true;
  }

  Future<LoginPageModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString("Token");
    print("New toen is $token");
    return LoginPageModel();
  }

  Future<bool> remove() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.clear();
  }
}
