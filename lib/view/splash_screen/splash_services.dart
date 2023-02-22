import 'package:attendance_app/models/login_page_model.dart';

import '../login_page/user_view_model.dart';

class SplashServices {
  void checkAuthentication() async {
    Future<Result> getUser() => UserViewModel().getUser();
  }
}
