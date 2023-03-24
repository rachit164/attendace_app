import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:attendance_app/utils/app_constants.dart';
import 'package:attendance_app/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/alert_message.dart';
import '../view/home_page/home_page.dart';

class Auth with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  var token;
  var result;
  String? userImage;
  String? userName;
  String? message;
  AlertMessages alert = AlertMessages();

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> login(
      String email, String password, BuildContext context) async {
    setLoading(true);
    try {
      final url = Uri.parse(AppConstants.BASE_URL + AppConstants.LOGIN);
      final response = await http.post(url,
          headers: <String, String>{
            'VTApiKey': AppConstants.VT_API_KEY,
            "content-type": "application/json",
            "accept": "application/json",
          },
          body: json.encode({
            "Company": {
              "CompanyId": 1,
              "CompanyName": "VertexPlus Technologies Private Limited",
              "CompanyCode": "VTPL03"
            },
            "EmailId": "admin@vertexplus.com",
            "Password": "password123",
            "GrantType": "password",
            "Reason": "Dummy Login Reason"
          }));
      print(response.body);
      final responseData = json.decode(response.body);
      print(responseData);

      result = responseData['Result'];
      token = result['Token'];
      var transactionMessage = result['TransactionMessage'];
      message = transactionMessage['Message'];
      userName = result['UserName'];
      userImage = result['EmaployeeImagePath'];

      if (responseData['Success'] == true) {
        Navigator.pushNamed(context, RoutesName.homepage);
        alert.showError(context, message!);
        setLoading(false);
      } else {
        setLoading(false);
        alert.showError(context, message!);
      }
    } on SocketException catch (e) {
      setLoading(false);
      alert.showError(context, "No internet Connection");
    }

    final prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token).toString();
    prefs.setString("userName", userName!).toString();
    prefs.setString("userImage", userImage!).toString();

    notifyListeners();
  }
}
