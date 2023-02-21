import 'dart:convert';
import 'dart:io';
import 'package:attendance_app/data/app_exceptions.dart';
import 'package:attendance_app/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../utils/app_constants.dart';

class NetworkApiService extends BaseApiService {
  final Map<String, String> _mainHeaders = <String, String>{
    'VTApiKey': AppConstants.VT_API_KEY,
    "content-type": "application/json",
    "accept": "application/json",
  };

  @override
  Future getGetResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;

    try {
      Response response =
          await post(Uri.parse(url), body: data, headers: _mainHeaders)
              .timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw BadRequestException(response.body.toString());

      case 500:
        throw UnAuthorisedException(response.body.toString());

      default:
        throw FetchDataException(
            'Error occurred while communicating with server' +
                'with status code' +
                response.statusCode.toString());
    }
  }
}
