class LoginPageModel {
  Result? result;
  bool? success;

  LoginPageModel({this.result, this.success});

  LoginPageModel.fromJson(Map<String, dynamic> json) {
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
  String? token;
  String? expiration;
  Null? refreshToken;
  String? userName;
  int? loginId;
  Null? loginDate;
  Null? expirationTime;
  bool? isUserAccess;
  bool? isUserActive;
  bool? isActive;
  UserRole? userRole;
  TransactionMessage? transactionMessage;
  String? emaployeeImagePath;
  String? companyCurrencyId;
  String? companyCurrencySymbol;

  Result(
      {this.token,
      this.expiration,
      this.refreshToken,
      this.userName,
      this.loginId,
      this.loginDate,
      this.expirationTime,
      this.isUserAccess,
      this.isUserActive,
      this.isActive,
      this.userRole,
      this.transactionMessage,
      this.emaployeeImagePath,
      this.companyCurrencyId,
      this.companyCurrencySymbol});

  Result.fromJson(Map<String, dynamic> json) {
    token = json['Token'];
    expiration = json['Expiration'];
    refreshToken = json['RefreshToken'];
    userName = json['UserName'];
    loginId = json['LoginId'];
    loginDate = json['LoginDate'];
    expirationTime = json['ExpirationTime'];
    isUserAccess = json['IsUserAccess'];
    isUserActive = json['IsUserActive'];
    isActive = json['IsActive'];
    userRole =
        json['UserRole'] != null ? UserRole.fromJson(json['UserRole']) : null;
    transactionMessage = json['TransactionMessage'] != null
        ? TransactionMessage.fromJson(json['TransactionMessage'])
        : null;
    emaployeeImagePath = json['EmaployeeImagePath'];
    companyCurrencyId = json['CompanyCurrencyId'];
    companyCurrencySymbol = json['CompanyCurrencySymbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Token'] = this.token;
    data['Expiration'] = this.expiration;
    data['RefreshToken'] = this.refreshToken;
    data['UserName'] = this.userName;
    data['LoginId'] = this.loginId;
    data['LoginDate'] = this.loginDate;
    data['ExpirationTime'] = this.expirationTime;
    data['IsUserAccess'] = isUserAccess;
    data['IsUserActive'] = isUserActive;
    data['IsActive'] = isActive;
    if (userRole != null) {
      data['UserRole'] = this.userRole!.toJson();
    }
    if (this.transactionMessage != null) {
      data['TransactionMessage'] = this.transactionMessage!.toJson();
    }
    data['EmaployeeImagePath'] = this.emaployeeImagePath;
    data['CompanyCurrencyId'] = this.companyCurrencyId;
    data['CompanyCurrencySymbol'] = this.companyCurrencySymbol;
    return data;
  }
}

class UserRole {
  int? userRoleId;
  int? companyId;
  String? userRoleName;
  String? userRoleCode;

  UserRole(
      {this.userRoleId, this.companyId, this.userRoleName, this.userRoleCode});

  UserRole.fromJson(Map<String, dynamic> json) {
    userRoleId = json['UserRoleId'];
    companyId = json['CompanyId'];
    userRoleName = json['UserRoleName'];
    userRoleCode = json['UserRoleCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['UserRoleId'] = this.userRoleId;
    data['CompanyId'] = this.companyId;
    data['UserRoleName'] = this.userRoleName;
    data['UserRoleCode'] = this.userRoleCode;
    return data;
  }
}

class TransactionMessage {
  int? status;
  String? message;
  bool? success;
  Null? errorMessage;

  TransactionMessage(
      {this.status, this.message, this.success, this.errorMessage});

  TransactionMessage.fromJson(Map<String, dynamic> json) {
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
