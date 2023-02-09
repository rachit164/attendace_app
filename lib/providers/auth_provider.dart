import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:attendance_app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/home_page/home_page.dart';

class Auth with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  var token;
  var result;
  String? userName;

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
            "EmailId": email,
            "Password": password,
            "GrantType": "password",
            "Reason": "Dummy Login Reason"
            // 'EmailId': 'admin@vertexplus.com',
            // 'Password': 'password123',
          }));
      // print(response.body);
      final responseData = json.decode(response.body);

      if (responseData['Success'] == true) {
        print("Successful");
        setLoading(true);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
        setLoading(false);
      } else {
        setLoading(true);
        print("failed");
      }
      result = responseData['Result'];
      token = result['Token'];
      print(token);
      userName = result['UserName'];
    } catch (e) {
      setLoading(false);
      print(e.toString());
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token).toString();
    await prefs.setString("userName", userName!).toString();

    notifyListeners();
  }
}
