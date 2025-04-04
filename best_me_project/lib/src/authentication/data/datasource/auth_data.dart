import 'dart:convert';

import 'package:best_me_project/core/services/url_api.dart';
import 'package:http/http.dart' as http;

abstract class AuthData {
  Future<String> signIn({required String username, required String password});
}

class AuthDataImpl implements AuthData {
  var client = http.Client();
  final Map<String, String> _requestHeaders = {
    'Content-Type': 'application/json',
    'X-TOKEN-ACCESS': 'ijCCtggxLEkG3Yg8hNKZJvMM4EA1Rw4VjVvyIOb7'
  };

  @override
  Future<String> signIn({
    required String username,
    required String password,
  }) async {
    var url = Uri.http(UrlApi.baseUrl, '${UrlApi.apiUrl}${UrlApi.loginUrl}');
    var body = {
      "identifier": username,
      "password": password,
    };

    try {
      var response = await client.post(
        url,
        headers: _requestHeaders,
        body: jsonEncode(body),
      );
      final Map<String, dynamic> data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return data['access_token'] ?? '';
      } else {
        return data['message'] ?? 'Error';
      }
    } catch (e) {
      throw Exception('Lỗi đăng nhập: $e');
    }
  }
}
