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
  var userImage;
  String? userName;
  String? message;

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
        //  print("Successful");
        setLoading(true);
        var snackBar = SnackBar(
          content: Text(message!),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
        setLoading(false);
      } else {
        setLoading(true);
        var snackBar = SnackBar(
          content: Text(message!),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        setLoading(false);
      }
      result = responseData['Result'];
      token = result['Token'];
      var transactionMessage = result['TransactionMessage'];
      message = transactionMessage['Message'];
      userName = result['UserName'];
      userImage = result['EmaployeeImagePath'];
    } on SocketException catch (e) {
      setLoading(false);
      const snackBar = SnackBar(
        content: Text('No Internet Connection'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (e) {
      var snackBar = SnackBar(
        content: Text(message!),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      setLoading(false);
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token).toString();
    await prefs.setString("userName", userName!).toString();

    notifyListeners();
  }
}
