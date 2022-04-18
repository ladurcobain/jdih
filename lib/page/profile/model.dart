class GetCompany {
  int? status;
  String? message;
  Result? result;

  GetCompany({this.status, this.message, this.result});

  GetCompany.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class Result {
  String? companyName;
  String? companyPhone;
  String? companyEmail;
  String? companyAddress;
  String? companyCaption;
  String? companyText;
  String? companyKeyword;
  String? companyDescription;
  String? companyImg;
  String? companyTmb;

  Result(
      {this.companyName,
      this.companyPhone,
      this.companyEmail,
      this.companyAddress,
      this.companyCaption,
      this.companyText,
      this.companyKeyword,
      this.companyDescription,
      this.companyImg,
      this.companyTmb});

  Result.fromJson(Map<String, dynamic> json) {
    companyName = json['company_name'];
    companyPhone = json['company_phone'];
    companyEmail = json['company_email'];
    companyAddress = json['company_address'];
    companyCaption = json['company_caption'];
    companyText = json['company_text'];
    companyKeyword = json['company_keyword'];
    companyDescription = json['company_description'];
    companyImg = json['company_img'];
    companyTmb = json['company_tmb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['company_name'] = companyName;
    data['company_phone'] = companyPhone;
    data['company_email'] = companyEmail;
    data['company_address'] = companyAddress;
    data['company_caption'] = companyCaption;
    data['company_text'] = companyText;
    data['company_keyword'] = companyKeyword;
    data['company_description'] = companyDescription;
    data['company_img'] = companyImg;
    data['company_tmb'] = companyTmb;
    return data;
  }
}

parseData(data) {
  if (data == null) {
    return {};
  }

  final parsed = GetCompany.fromJson(data);
  return parsed;
}
