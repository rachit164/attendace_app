import 'dart:convert';

import 'package:attendance_app/models/drop_down_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../utils/app_constants.dart';

class DropDownProvider with ChangeNotifier {
  List<DropDown> _dropDownList = [];
  List<DropDown> get dropDownList => _dropDownList;

  Future<void> dropDown() async {
    try {
      final url = Uri.parse(AppConstants.BASE_URL + AppConstants.DROP_DOWN);
      final response = await http.post(url, headers: <String, String>{
        'VTApiKey':
            'VTPL_APP01_03_IbLKyiuhyKBLUJSgipwlactuyI87UJJNBRTFSPLIKEO87656#\$%#@@.E',
        "content-type": "application/json",
        "accept": "application/json",
      });
      //  print(response.body);

      // List<dynamic> list = json.decode(response.body);
      // print(list);
      // _dropDownList = [];
      // _dropDownList.addAll(DropDown.fromJson(response.body).dropdown);
      final responseData = json.decode(response.body);
      List<dynamic> list = responseData;
      DropDown data = DropDown.fromJson(list[0]);
      print(data);
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }
}
