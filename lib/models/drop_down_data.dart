class DropDown {
  int? companyId;
  String? companyName;
  String? companyCode;
  // late List<DropDown>? _dropdown;
  // List<DropDown> get dropdown => _dropdown!;

  DropDown(
      {required this.companyId,
      required this.companyName,
      required this.companyCode});

  DropDown.fromJson(Map<String, dynamic> json) {
    companyId = json['CompanyId'];
    companyName = json['CompanyName'];
    companyCode = json['CompanyCode'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = Map<String, dynamic>();
  //   data['CompanyId'] = this.companyId;
  //   data['CompanyName'] = this.companyName;
  //   data['CompanyCode'] = this.companyCode;
  //   return data;
  // }
}
