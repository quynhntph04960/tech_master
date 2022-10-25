class CityResponse {
  CityResponse({
    this.responseTime,
    this.code,
    this.message,
    this.data,
  });

  CityResponse.fromJson(dynamic json) {
    responseTime = json['responseTime'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(DataCity.fromJson(v));
      });
    }
  }
  String? responseTime;
  int? code;
  String? message;
  List<DataCity>? data;

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

class DataCity {
  DataCity({
    this.id,
    this.name,
  });

  DataCity.fromJson(dynamic json) {
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
