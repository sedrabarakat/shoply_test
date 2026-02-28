class ApiRequest {
  final String url;
  final Map<String, dynamic>? headers;
  final Map<String, dynamic>? params;
  final Map<String, dynamic>? body;

  ApiRequest({
    required this.url,
    this.body,
    this.params,
    this.headers,
  });
}
