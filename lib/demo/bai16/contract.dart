class Contract {
  int? id;
  String? name;
  String? avatar;
  String? createdDate;

  Contract({
    this.id,
    this.name,
    this.avatar,
    this.createdDate,
  });

  Contract.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    avatar = json['avatar'];
    createdDate = json['createdDate'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['avatar'] = avatar;
    map['createdDate'] = createdDate;
    return map;
  }
}
