class UploadFileResponse {
  UploadFileResponse({
    this.code,
    this.message,
    this.data,
  });

  UploadFileResponse.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? DataUploadFile.fromJson(json['data']) : null;
  }
  int? code;
  String? message;
  DataUploadFile? data;

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

class DataUploadFile {
  DataUploadFile({
    this.contentType,
    this.extension,
    this.name,
    this.size,
    this.path,
  });

  DataUploadFile.fromJson(dynamic json) {
    contentType = json['contentType'];
    extension = json['extension'];
    name = json['name'];
    size = json['size'];
    path = json['path'];
  }
  String? contentType;
  String? extension;
  String? name;
  String? size;
  String? path;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['contentType'] = contentType;
    map['extension'] = extension;
    map['name'] = name;
    map['size'] = size;
    map['path'] = path;
    return map;
  }
}
