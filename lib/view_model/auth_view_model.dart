import 'package:attendance_app/repository/auth_repository.dart';
import 'package:attendance_app/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';

import '../utils/alert_message.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  AlertMessages alert = AlertMessages();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      alert.showError(context, 'Login Successfully');
      Navigator.pushNamed(context, RoutesName.homepage);
      print("response is " + value.toString());
    }).onError((error, stackTrace) {
      setLoading(false);
      alert.showError(context, error.toString());
      print(error.toString());
    });
  }
}
