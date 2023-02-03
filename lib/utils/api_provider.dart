import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import '../widgets/alert_message.dart';

class HttpService {
  AlertMessages alert = AlertMessages();
  Future postApi(
      String url, Map<String, dynamic> body, BuildContext context) async {
    var res = await post(Uri.parse(url), body: body);
    if (res.statusCode == 200) {
      var body = json.decode(res.body);
      if (body['status'] != 'success') {
        await alert.showError(context, body['message'].toString());
      }
      return body;
    } else {
      // await loaders.hideLoader();
      await alert.showError(context, 'Something went wrong');
      throw 'Something went wrong';
    }
  }
}
