import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/login_page_model.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(Result user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final toke = sp.setString("Token", user.token.toString());
    print("my all new token $toke");
    notifyListeners();

    return true;
  }

  Future<Result> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString("token");
    print("New toen is $token");
    return Result(token: token.toString());
  }

  Future<bool> remove() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.clear();
  }
}
