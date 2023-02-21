import 'dart:convert';

import 'package:attendance_app/models/drop_down_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../utils/app_constants.dart';

class DropDownProvider with ChangeNotifier {
  List<DropDown> _dropDownItems = [];

  Future<void> dropDown() async {
    try {
      final url = Uri.parse(AppConstants.BASE_URL + AppConstants.DROP_DOWN);
      final response = await http.post(url, headers: <String, String>{
        'VTApiKey':
            'VTPL_APP01_03_IbLKyiuhyKBLUJSgipwlactuyI87UJJNBRTFSPLIKEO87656#\$%#@@.E',
        "content-type": "application/json",
        "accept": "application/json",
      });
      var data = response.body;

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData == null) {
          return;
        }

        // List<DropDown> _dropDownList = [];
        // responseData.forEach((key, value) {
        //   _dropDownList.add(
        //     DropDown(
        //       companyName: value['CompanyName'],
        //       companyCode: value['CompanyCode'],
        //       companyId: value['CompanyId'],
        //     ),
        //   );
        // });
        // _dropDownItems = _dropDownList.toList();
        // print(_dropDownItems);

        //  return responseData.map((data) => DropDown.fromJson(data)).toList;

      } else {
        throw Exception('Unexpected error occured');
      }
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }
}
