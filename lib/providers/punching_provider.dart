import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../pages/punching/punching.dart';
import '../utils/app_constants.dart';

class PunchingProvider with ChangeNotifier {
  Future<void> punchInOut(double? lat, double? long, String punchIn,
      String punchOut, BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    print("Punch In " + punchIn);
    print("Punch out " + punchOut);
    print("lat " + lat.toString());
    print("long " + long.toString());

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
          "PunchIn": punchIn,
          "PunchOut": punchOut,
          "Latitude": lat.toString(),
          "Longitude": long.toString(),
          "IsIn": true
        }));

    final responseData = json.decode(response.body);

    if (responseData['Success'] == true) {
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => const PunchingPage()));
    } else {
      print("failed");
    }
  }
}
