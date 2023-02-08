import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/app_constants.dart';

class PunchingProvider with ChangeNotifier {
  final prefs = SharedPreferences.getInstance();

  Future<void> punchInOut() async {
    final url =
        Uri.parse(AppConstants.BASE_URL + AppConstants.EMPLOYEE_PUNCHING);
    final response = await http.post(url,
        headers: <String, String>{
          'VTApiKey': AppConstants.VT_API_KEY,
          "content-type": "application/json",
          "accept": "application/json",
        },
        body: json.encode(
          {
            {
              "EmployeeId": 7,
              "PunchIn": "10:15:00",
              "PunchOut": "7:15:00",
              "Latitude": "000.000",
              "Longitude": "000.000",
              "IsIn": true
            }
          },
        ));
  }
}
