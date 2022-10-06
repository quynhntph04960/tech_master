class UserResponse {
  UserResponse({
    this.code,
    this.message,
    this.data,
  });

  UserResponse.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? DataUser.fromJson(json['data']) : null;
  }
  int? code;
  String? message;
  DataUser? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class DataUser {
  DataUser({
    this.id,
    this.createdAt,
    this.createdBy,
    this.modifiedAt,
    this.modifiedBy,
    this.name,
    this.dateOfBirth,
    this.address,
    this.gender,
    this.phoneNumber,
    this.email,
    this.avatar,
    this.token,
  });

  DataUser.fromJson(dynamic json) {
    id = json['id'];
    createdAt = json['createdAt'];
    createdBy = json['createdBy'];
    modifiedAt = json['modifiedAt'];
    modifiedBy = json['modifiedBy'];
    name = json['name'];
    dateOfBirth = json['dateOfBirth'];
    address = json['address'];
    gender = json['gender'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    avatar = json['avatar'];
    token = json['token'];
  }
  int? id;
  String? createdAt;
  String? createdBy;
  String? modifiedAt;
  dynamic modifiedBy;
  String? name;
  String? dateOfBirth;
  String? address;
  bool? gender;
  String? phoneNumber;
  String? email;
  dynamic avatar;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['createdAt'] = createdAt;
    map['createdBy'] = createdBy;
    map['modifiedAt'] = modifiedAt;
    map['modifiedBy'] = modifiedBy;
    map['name'] = name;
    map['dateOfBirth'] = dateOfBirth;
    map['address'] = address;
    map['gender'] = gender;
    map['phoneNumber'] = phoneNumber;
    map['email'] = email;
    map['avatar'] = avatar;
    map['token'] = token;
    return map;
  }
}
