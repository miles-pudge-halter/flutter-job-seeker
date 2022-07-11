import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class BaseNetwork {
  static const String baseUrl = "findwork.dev";

  static Future<Map<String, dynamic>?> get(
      String partUrl, {Map<String, dynamic>? queryParams}) async {
    final uri = Uri.https(baseUrl, partUrl, queryParams);

    debugPrint("BaseNetwork - fullUrl : ${uri.toString()}");

    final response = await http.get(
      uri,
      headers: {
        "Authorization": "Token 1f674c11fd8e795b6e84cbcafe9e26dd36596531",
      },
    );

    debugPrint("BaseNetwork - response : ${response.body}");

    return _processResponse(response);
  }

  static Future<Map<String, dynamic>?> post(
      String partUrl, Map<String, dynamic> data) async {
    final uri = Uri.https(baseUrl, partUrl);

    debugPrint("BaseNetwork - fullUrl : ${uri.toString()}");
    final response = await http.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: json.encode(data),
    );
    debugPrint("BaseNetwork - response : ${response.body}");
    return _processResponse(response);
  }

  static Future<Map<String, dynamic>?> _processResponse(
      http.Response response) async {
    final body = response.body;
    if (body.isNotEmpty) {
      final jsonBody = json.decode(body);
      return jsonBody;
    } else {
      debugPrint("processResponse error");
      return {"error": true};
    }
  }
}
