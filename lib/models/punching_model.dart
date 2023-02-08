class PunchingModel {
  Result? result;
  bool? success;

  PunchingModel({this.result, this.success});

  PunchingModel.fromJson(Map<String, dynamic> json) {
    result = json['Result'] != null ? Result.fromJson(json['Result']) : null;
    success = json['Success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.result != null) {
      data['Result'] = this.result!.toJson();
    }
    data['Success'] = this.success;
    return data;
  }
}

class Result {
  int? status;
  Null? message;
  bool? success;
  Null? errorMessage;

  Result({this.status, this.message, this.success, this.errorMessage});

  Result.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    success = json['Success'];
    errorMessage = json['ErrorMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Status'] = this.status;
    data['Message'] = this.message;
    data['Success'] = this.success;
    data['ErrorMessage'] = this.errorMessage;
    return data;
  }
}
