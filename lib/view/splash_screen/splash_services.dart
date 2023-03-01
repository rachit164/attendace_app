import 'package:attendance_app/models/login_page_model.dart';
import 'package:attendance_app/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';

import '../login_page/user_view_model.dart';

class SplashServices {
  Future<LoginPageModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserData().then((value) {
      // if (value.token == null || value.token == '') {
      //   Navigator.pushNamed(context, RoutesName.loginPage);
      // } else {
      //   Navigator.pushNamed(context, RoutesName.homepage);
      // }
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }
}
