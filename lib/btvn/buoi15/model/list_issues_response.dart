class ListIssuesResponse {
  ListIssuesResponse({
    this.code,
    this.message,
    this.data,
  });

  ListIssuesResponse.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataIssues.fromJson(v));
      });
    }
  }
  int? code;
  String? message;
  List<DataIssues>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class DataIssues {
  DataIssues({
    this.id,
    this.createdAt,
    this.createdBy,
    this.title,
    this.content,
    this.photos,
    this.status,
    this.isEnable,
    this.accountPublic,
  });

  DataIssues.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['createdAt'];
    createdBy = json['createdBy'];
    title = json['title'];
    content = json['content'];
    photos = json['photos'] != null ? json['photos'].cast<String>() : [];
    status = json['status'];
    isEnable = json['isEnable'];
    accountPublic = json['accountPublic'] != null
        ? AccountPublic.fromJson(json['accountPublic'])
        : null;
  }
  int? id;
  String? createdAt;
  String? createdBy;
  String? title;
  String? content;
  List<String>? photos;
  int? status;
  bool? isEnable;
  AccountPublic? accountPublic;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['createdBy'] = createdBy;
    map['title'] = title;
    map['content'] = content;
    map['photos'] = photos;
    map['status'] = status;
    map['isEnable'] = isEnable;
    if (accountPublic != null) {
      map['accountPublic'] = accountPublic?.toJson();
    }
    return map;
  }
}

class AccountPublic {
  AccountPublic({
    this.id,
    this.name,
    this.avatar,
  });

  AccountPublic.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    avatar = json['avatar'];
  }
  int? id;
  String? name;
  String? avatar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['avatar'] = avatar;
    return map;
  }
}
