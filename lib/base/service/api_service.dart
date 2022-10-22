import 'dart:convert';

import 'package:btvn_techmaster/base/ui/toast_view.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../main.dart';

class APIService {
  static final _service = APIService._internal();

  factory APIService() => _service;

  APIService._internal();

  Future request({
    Method method = Method.get,
    required String path,
    Map<String, dynamic>? body,
    XFile? file,
  }) async {
    final uri = Uri.parse("http://api.quynhtao.com/api/" + path);
    print('call api: $uri');
    print('params api: $body');
    http.Response response;

    final headers = {
      "Authorization": "Bearer $token",
      "DeviceID": "",
      "Language": "",
    };
    print('headers api: $headers');

    if (file != null) {
      final request = http.MultipartRequest("Post", uri);
      request.headers.addAll(headers);
      request.files.add(
        http.MultipartFile.fromBytes(
          "file",
          await file.readAsBytes(),
          filename: file.path.split('/').last,
        ),
      );
      final stream = await request.send();
      response = await http.Response.fromStream(stream);
    } else {
      switch (method) {
        case Method.get:
          response = await http.get(uri, headers: headers);
          break;
        case Method.put:
          response =
              await http.put(uri, body: body, headers: headers, encoding: utf8);
          break;
        case Method.delete:
          response = await http.delete(uri,
              body: body, headers: headers, encoding: utf8);
          break;
        default:
          response = await http.post(uri,
              body: body, headers: headers, encoding: utf8);
          break;
      }
    }

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final json = jsonDecode(response.body);

      if (json['code'] == 0) {
        // map, dictionary, key:value
        final data = json['data'];
        return json;
      } else {
        showErrorToast(json['message']);
        throw Exception(json['message']);
      }
    }
    showErrorToast('Có lỗi xảy ra, http status code: ${response.statusCode}');
    throw Exception('Có lỗi xảy ra, http status code: ${response.statusCode}');
  }
}

final apiService = APIService();

enum Method { get, post, put, delete }
