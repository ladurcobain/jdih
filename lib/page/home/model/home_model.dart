class Home {
  int? status;
  String? message;
  Result? result;

  Home({this.status, this.message, this.result});

  Home.fromJson(Map<String, dynamic> json) {
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
  List<Sliders>? slider;
  List<GroupYear>? groupYear;
  List<GroupCategory>? groupCategory;

  Result({this.slider, this.groupYear, this.groupCategory});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['slider'] != null) {
      slider = <Sliders>[];
      json['slider'].forEach((v) {
        slider!.add(Sliders.fromJson(v));
      });
    }
    if (json['group_year'] != null) {
      groupYear = <GroupYear>[];
      json['group_year'].forEach((v) {
        groupYear!.add(GroupYear.fromJson(v));
      });
    }
    if (json['group_category'] != null) {
      groupCategory = <GroupCategory>[];
      json['group_category'].forEach((v) {
        groupCategory!.add(GroupCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (slider != null) {
      data['slider'] = slider!.map((v) => v.toJson()).toList();
    }
    if (groupYear != null) {
      data['group_year'] = groupYear!.map((v) => v.toJson()).toList();
    }
    if (groupCategory != null) {
      data['group_category'] = groupCategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sliders {
  String? sliderId;
  String? sliderName;
  String? sliderText;
  String? sliderImg;
  String? sliderTmb;

  Sliders(
      {this.sliderId,
      this.sliderName,
      this.sliderText,
      this.sliderImg,
      this.sliderTmb});

  Sliders.fromJson(Map<String, dynamic> json) {
    sliderId = json['slider_id'];
    sliderName = json['slider_name'];
    sliderText = json['slider_text'];
    sliderImg = json['slider_img'];
    sliderTmb = json['slider_tmb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slider_id'] = sliderId;
    data['slider_name'] = sliderName;
    data['slider_text'] = sliderText;
    data['slider_img'] = sliderImg;
    data['slider_tmb'] = sliderTmb;
    return data;
  }
}

class GroupYear {
  String? title;
  String? count;

  GroupYear({this.title, this.count});

  GroupYear.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['count'] = count;
    return data;
  }
}

class GroupCategory {
  String? title;
  var count;

  GroupCategory({this.title, this.count});

  GroupCategory.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['count'] = count;
    return data;
  }
}

parseHome(data) {
  if (data == null) {
    return {};
  }

  final parsed = Home.fromJson(data);
  return parsed;
}
