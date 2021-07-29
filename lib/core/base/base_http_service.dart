import 'package:flutter_mvvm_starter/core/base/base_service.dart';
import 'package:flutter_mvvm_starter/core/http/http_response.dart';
import 'package:flutter_mvvm_starter/core/http/response_handler.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

enum AuthenticationMethod {
  Basic,
  JWT,
}
const AuthorizationToken = 'authorizationtoken';

abstract class BaseHttpService extends BaseService {
  late final http.Client client;
  BaseHttpService() {
    client = http.Client();
  }

  String get endpoint;

  Future<HttpResponse> get(
    String url, {
    AuthenticationMethod authenticationMethod: AuthenticationMethod.JWT,
  }) async {
    Map<String, String> headers = {};
    _addAuth(authenticationMethod, headers);
    var response = await client.get(
      Uri.parse(url),
      headers: headers,
    );
    return ResponseHandler.handle(response);
  }

  Future<HttpResponse> post(
    String url,
    dynamic body, {
    isJson: false,
    AuthenticationMethod authenticationMethod: AuthenticationMethod.JWT,
  }) async {
    Map<String, String> headers = {
      "content-type": "application/json",
      "accept": "application/json",
    };
    _addAuth(authenticationMethod, headers);
    try {
      var response = await client.post(
        Uri.parse(url),
        headers: headers,
        body: json.encode(body),
      );
      return ResponseHandler.handle(response, isJson: isJson);
    } catch (e) {
      log.e('Http error $e');
      return ResponseHandler.buildErrorMessage();
    }
  }

  void close() {
    client.close();
  }

  void _addAuth(
    AuthenticationMethod authenticationMethod,
    Map<String, String> headers, {
    String? username,
    String? password,
    String? token,
  }) {
    if (authenticationMethod == AuthenticationMethod.Basic &&
        username != null &&
        password != null) {
      headers['authorization'] =
          'Basic ' + base64Encode(utf8.encode(username + ':' + password));
    } else if (token != null) {
      headers[AuthorizationToken] = token;
    }
  }
}
