import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/app_constants.dart';

class PunchingProvider with ChangeNotifier {
  Future<void> punchInOut(double lat, double long) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    final url =
        Uri.parse(AppConstants.BASE_URL + AppConstants.EMPLOYEE_PUNCHING);
    print(url);

    final response = await http.post(url,
        headers: <String, String>{
          'VTApiKey': AppConstants.VT_API_KEY,
          "content-type": "application/json",
          "accept": "application/json",
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
        body: json.encode({
          "EmployeeId": 7,
          "PunchIn": "10:15:00",
          "PunchOut": "7:15:00",
          "Latitude": lat.toString(),
          "Longitude": long.toString(),
          "IsIn": true
        }));
    print("response is" + response.body);
    final responseData = json.decode(response.body);
    print(responseData);
    if (responseData['Success'] == true) {
      print("success");
    } else {
      print("failed");
    }
  }
}