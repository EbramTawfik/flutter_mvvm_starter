class HttpResponse {
  bool succes;
  String message;
  dynamic body;
  Map<String, String> headers;
  HttpResponse({this.body, this.message, this.succes, this.headers});
}
