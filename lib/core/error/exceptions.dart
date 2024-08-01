class ServerException implements Exception {
  const ServerException([this.message]);

  final String? message;
}

class NetworkException implements Exception {
  const NetworkException([this.message]);

  final String? message;
}

class CacheException implements Exception {
  const CacheException([this.message]);

  final String? message;
}

class ConnectionException implements Exception {
  const ConnectionException([this.message]);

  final String? message;
}

class SessionExpiredException implements Exception {
  const SessionExpiredException([this.message]);

  final String? message;
}

class PermissionException implements Exception {
  const PermissionException([this.message]);

  final String? message;
}
