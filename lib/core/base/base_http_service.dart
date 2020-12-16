import 'package:flutter_mvvm_starter/core/base/base_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class BaseHttpService extends BaseService {
  var client = new http.Client();

  String get endpoint;

  Future<List<dynamic>> getList(String url) async {
    // Get user posts for id
    var response = await client.get(url);
    // parse into List
    return json.decode(response.body) as List<dynamic>;
  }
}
