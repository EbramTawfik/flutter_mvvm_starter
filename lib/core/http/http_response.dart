class HttpResponse {
  bool succes;
  String? message;
  dynamic body;
  Map<String, String>? headers;
  HttpResponse({
    this.body,
    required this.message,
    required this.succes,
    this.headers,
  });
}
