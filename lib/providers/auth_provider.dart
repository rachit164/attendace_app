import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:attendance_app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
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
      print(response.body);
      final responseData = json.decode(response.body);
      // if (responseData['error'] != null) {
      //   print(responseData);
      //   throw HttpException(responseData['error']['message']);
      // }
      //
      if (responseData['Success'] == true) {
        print("Successful");
        setLoading(false);
      } else {
        setLoading(true);
        print("failed");
      }
    } catch (e) {
      setLoading(false);
      print(e.toString());
    }
    notifyListeners();
  }
}