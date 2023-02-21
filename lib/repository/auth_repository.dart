import 'package:attendance_app/data/network/BaseApiServices.dart';
import 'package:attendance_app/data/network/NetworkApiService.dart';
import 'package:attendance_app/utils/app_constants.dart';

class AuthRepository {
  BaseApiService _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppConstants.BASE_URL + AppConstants.LOGIN, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
