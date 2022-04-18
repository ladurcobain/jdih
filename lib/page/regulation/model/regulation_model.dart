class Regulation {
  int? status;
  String? message;
  Result? result;

  Regulation({this.status, this.message, this.result});

  Regulation.fromJson(Map<String, dynamic> json) {
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
  int? count;
  int? limit;
  int? offset;
  List<Datas>? datas;
  List<Categorys>? categorys;
  List<Years>? years;

  Result(
      {this.count,
      this.limit,
      this.offset,
      this.datas,
      this.categorys,
      this.years});

  Result.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    limit = json['limit'];
    offset = json['offset'];
    if (json['datas'] != null) {
      datas = <Datas>[];
      json['datas'].forEach((v) {
        datas!.add(new Datas.fromJson(v));
      });
    }
    if (json['categorys'] != null) {
      categorys = <Categorys>[];
      json['categorys'].forEach((v) {
        categorys!.add(new Categorys.fromJson(v));
      });
    }
    if (json['years'] != null) {
      years = <Years>[];
      json['years'].forEach((v) {
        years!.add(new Years.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['limit'] = this.limit;
    data['offset'] = this.offset;
    if (this.datas != null) {
      data['datas'] = this.datas!.map((v) => v.toJson()).toList();
    }
    if (this.categorys != null) {
      data['categorys'] = this.categorys!.map((v) => v.toJson()).toList();
    }
    if (this.years != null) {
      data['years'] = this.years!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Datas {
  String? regulationId;
  String? regulationSlug;
  String? regulationNo;
  String? regulationYear;
  String? regulationTitle;
  String? regulationSubject;
  String? regulationHeadline;
  String? regulationCondition;
  String? regulationFile;
  String? regulationFileurl;
  String? regulationCategory;
  String? regulationSubcategory;
  String? regulationDownloadcount;
  String? regulationViewcount;

  Datas(
      {this.regulationId,
      this.regulationSlug,
      this.regulationNo,
      this.regulationYear,
      this.regulationTitle,
      this.regulationSubject,
      this.regulationHeadline,
      this.regulationCondition,
      this.regulationFile,
      this.regulationFileurl,
      this.regulationCategory,
      this.regulationSubcategory,
      this.regulationDownloadcount,
      this.regulationViewcount});

  Datas.fromJson(Map<String, dynamic> json) {
    regulationId = json['regulation_id'];
    regulationSlug = json['regulation_slug'];
    regulationNo = json['regulation_no'];
    regulationYear = json['regulation_year'];
    regulationTitle = json['regulation_title'];
    regulationSubject = json['regulation_subject'];
    regulationHeadline = json['regulation_headline'];
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
    data['regulation_year'] = this.regulationYear;
    data['regulation_title'] = this.regulationTitle;
    data['regulation_subject'] = this.regulationSubject;
    data['regulation_headline'] = this.regulationHeadline;
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

class Categorys {
  String? categoryId;
  String? categoryName;
  String? categoryCode;

  Categorys({this.categoryId, this.categoryName, this.categoryCode});

  Categorys.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryCode = json['category_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['category_code'] = this.categoryCode;
    return data;
  }
}

class Years {
  String? yearId;
  String? yearName;

  Years({this.yearId, this.yearName});

  Years.fromJson(Map<String, dynamic> json) {
    yearId = json['year_id'];
    yearName = json['year_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year_id'] = this.yearId;
    data['year_name'] = this.yearName;
    return data;
  }
}

parseRegulation(data) {
  if (data == null) {
    return {};
  }

  final parsed = Regulation.fromJson(data);
  return parsed;
}
