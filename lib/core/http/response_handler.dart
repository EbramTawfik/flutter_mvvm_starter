import 'package:flutter_mvvm_starter/core/constants/user_messages.dart';
import 'package:flutter_mvvm_starter/core/http/http_response.dart';
import 'package:http/http.dart';

import 'dart:convert';

class ResponseHandler {
  static HttpResponse handle(Response response, {bool isJson = true}) {
    HttpResponse result;
    switch (response.statusCode) {
      case 200:
        result = HttpResponse(
          body: response.body,
          succes: true,
          message: response.reasonPhrase,
          headers: response.headers,
        );
        if (isJson) result.body = json.decode(result.body);
        break;
      case 401:
        result = buildErrorMessage(
          response: response,
          message: HttpResponseMessage.Unauthorized,
        );
        break;
      default:
        result = buildErrorMessage(
          response: response,
          message: response.reasonPhrase,
        );
    }
    return result;
  }

  static HttpResponse buildErrorMessage({
    Response? response,
    String? message,
  }) {
    if (response == null) {
      return HttpResponse(
        succes: false,
        message: HttpResponseMessage.IPError,
      );
    }
    return HttpResponse(
      body: response.body,
      succes: false,
      message: message,
    );
  }
}
