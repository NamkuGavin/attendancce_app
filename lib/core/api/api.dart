class Api {
  final String _url = ''; //TODO: FILL URL

  String get url => _url;

  static Map<String, String> headers() {
    return {
      'Accept': 'application/json',
      'Content-type': 'application/json',
    };
  }

  static Map<String, String> headersToken(String token) {
    return {
      'Accept': 'application/json',
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }
}
