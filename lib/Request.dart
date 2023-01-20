class Request {
  final String url;
  final String method;
  final String body;
  final Headers headers;
  final String data;
  final String params;
  final String responseType;
  final int maxContentLength;
  final int maxBodyLength;
  int timeout;

  Request(
    this.url, {
    this.headers = const Headers(),
    this.method = '',
    this.body = '',
    this.data = '',
    this.params = '',
    this.responseType = '',
    this.maxContentLength = 0,
    this.maxBodyLength = 0,
    this.timeout = 0,
  });
}

class Headers {
  // ignore: non_constant_identifier_names
  final String contentType;
  // ignore: non_constant_identifier_names
  final String userAgent;
  final String host;
  final String accept;
  // ignore: non_constant_identifier_names
  final String acceptEncoding;
  final String connection;
  // ignore: non_constant_identifier_names
  final String contentLength;

  const Headers({
    this.contentType = '',
    this.userAgent = '',
    this.host = '',
    this.accept = '',
    this.acceptEncoding = '',
    this.connection = '',
    this.contentLength = '',
  });

  Map toJson() => {
        'contentType': contentType,
        'userAgent': userAgent,
        'host': host,
        'accept': accept,
        'acceptEncoding': acceptEncoding,
        'connection': connection,
        'contentLength': ''
      };
}
