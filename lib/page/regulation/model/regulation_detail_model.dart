class RegulationDetailData {
  int? status;
  String? message;
  Result? result;

  RegulationDetailData({this.status, this.message, this.result});

  RegulationDetailData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  String? regulationId;
  String? regulationSlug;
  String? regulationNo;
  String? regulationTitle;
  String? regulationSubject;
  String? regulationHeadline;
  String? regulationYear;
  String? regulationDate;
  String? regulationNumber;
  String? regulationCode;
  String? regulationShort;
  String? regulationEdition;
  String? regulationPlace;
  String? regulationPublisher;
  String? regulationSource;
  String? regulationIsbn;
  String? regulationVariety;
  String? regulationSector;
  String? regulationLanguage;
  String? regulationDescription;
  String? regulationHistory;
  String? regulationCondition;
  String? regulationFile;
  String? regulationFileurl;
  String? regulationCategory;
  String? regulationSubcategory;
  String? regulationDownloadcount;
  String? regulationViewcount;

  Result(
      {this.regulationId,
      this.regulationSlug,
      this.regulationNo,
      this.regulationTitle,
      this.regulationSubject,
      this.regulationHeadline,
      this.regulationYear,
      this.regulationDate,
      this.regulationNumber,
      this.regulationCode,
      this.regulationShort,
      this.regulationEdition,
      this.regulationPlace,
      this.regulationPublisher,
      this.regulationSource,
      this.regulationIsbn,
      this.regulationVariety,
      this.regulationSector,
      this.regulationLanguage,
      this.regulationDescription,
      this.regulationHistory,
      this.regulationCondition,
      this.regulationFile,
      this.regulationFileurl,
      this.regulationCategory,
      this.regulationSubcategory,
      this.regulationDownloadcount,
      this.regulationViewcount});

  Result.fromJson(Map<String, dynamic> json) {
    regulationId = json['regulation_id'];
    regulationSlug = json['regulation_slug'];
    regulationNo = json['regulation_no'];
    regulationTitle = json['regulation_title'];
    regulationSubject = json['regulation_subject'];
    regulationHeadline = json['regulation_headline'];
    regulationYear = json['regulation_year'];
    regulationDate = json['regulation_date'];
    regulationNumber = json['regulation_number'];
    regulationCode = json['regulation_code'];
    regulationShort = json['regulation_short'];
    regulationEdition = json['regulation_edition'];
    regulationPlace = json['regulation_place'];
    regulationPublisher = json['regulation_publisher'];
    regulationSource = json['regulation_source'];
    regulationIsbn = json['regulation_isbn'];
    regulationVariety = json['regulation_variety'];
    regulationSector = json['regulation_sector'];
    regulationLanguage = json['regulation_language'];
    regulationDescription = json['regulation_description'];
    regulationHistory = json['regulation_history'];
    regulationCondition = json['regulation_condition'];
    regulationFile = json['regulation_file'];
    regulationFileurl = json['regulation_fileurl'];
    regulationCategory = json['regulation_category'];
    regulationSubcategory = json['regulation_subcategory'];
    regulationDownloadcount = json['regulation_downloadcount'];
    regulationViewcount = json['regulation_viewcount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['regulation_id'] = this.regulationId;
    data['regulation_slug'] = this.regulationSlug;
    data['regulation_no'] = this.regulationNo;
    data['regulation_title'] = this.regulationTitle;
    data['regulation_subject'] = this.regulationSubject;
    data['regulation_headline'] = this.regulationHeadline;
    data['regulation_year'] = this.regulationYear;
    data['regulation_date'] = this.regulationDate;
    data['regulation_number'] = this.regulationNumber;
    data['regulation_code'] = this.regulationCode;
    data['regulation_short'] = this.regulationShort;
    data['regulation_edition'] = this.regulationEdition;
    data['regulation_place'] = this.regulationPlace;
    data['regulation_publisher'] = this.regulationPublisher;
    data['regulation_source'] = this.regulationSource;
    data['regulation_isbn'] = this.regulationIsbn;
    data['regulation_variety'] = this.regulationVariety;
    data['regulation_sector'] = this.regulationSector;
    data['regulation_language'] = this.regulationLanguage;
    data['regulation_description'] = this.regulationDescription;
    data['regulation_history'] = this.regulationHistory;
    data['regulation_condition'] = this.regulationCondition;
    data['regulation_file'] = this.regulationFile;
    data['regulation_fileurl'] = this.regulationFileurl;
    data['regulation_category'] = this.regulationCategory;
    data['regulation_subcategory'] = this.regulationSubcategory;
    data['regulation_downloadcount'] = this.regulationDownloadcount;
    data['regulation_viewcount'] = this.regulationViewcount;
    return data;
  }
}

parseRegulationDetail(data) {
  if (data == null) {
    return {};
  }

  final parsed = RegulationDetailData.fromJson(data);
  return parsed;
}
