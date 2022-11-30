class Message {
  Message({
    this.name,
    this.text,
    this.error,
  });

  Message.fromJson(dynamic json) {
    name = json['Name'];
    text = json['Text'];
    error = json['Error'];
  }
  String? name;
  String? text;
  String? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Name'] = name;
    map['Text'] = text;
    map['Error'] = error;
    return map;
  }
}
