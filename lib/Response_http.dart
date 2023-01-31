class Response {
  int contentLength;
  int hashCode;
  final Map<String, String> headers;
  bool isRedirect;
  bool persistentConnection;
  final int statusCode;
  final String data;

  Response({
    required this.hashCode,
    required this.isRedirect,
    required this.persistentConnection,
    required this.contentLength,
    required this.statusCode,
    required this.headers,
    required this.data,
  });
}
