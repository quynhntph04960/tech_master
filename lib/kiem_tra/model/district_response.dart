class DistrictResponse {
  DistrictResponse({
    this.responseTime,
    this.code,
    this.message,
    this.data,
  });

  DistrictResponse.fromJson(dynamic json) {
    responseTime = json['responseTime'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataDistrict.fromJson(v));
      });
    }
  }
  String? responseTime;
  int? code;
  String? message;
  List<DataDistrict>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['responseTime'] = responseTime;
    map['code'] = code;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class DataDistrict {
  DataDistrict({
    this.id,
    this.createdOn,
    this.name,
    this.city,
  });

  DataDistrict.fromJson(dynamic json) {
    id = json['id'];
    createdOn = json['createdOn'];
    name = json['name'];
    city = json['city'] != null ? City.fromJson(json['city']) : null;
  }
  String? id;
  String? createdOn;
  String? name;
  City? city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createdOn'] = createdOn;
    map['name'] = name;
    if (city != null) {
      map['city'] = city?.toJson();
    }
    return map;
  }
}

class City {
  City({
    this.id,
    this.name,
  });

  City.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  String? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}
