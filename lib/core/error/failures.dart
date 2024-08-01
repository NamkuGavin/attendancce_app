import 'package:equatable/equatable.dart';

import '../constant/constant.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  ServerFailure([this.message]);

  final String? message;
}

class NetworkFailure extends Failure {
  NetworkFailure([this.message]);

  final String? message;
}

class CacheFailure extends Failure {
  CacheFailure([this.message]);

  final String? message;
}

class ConnectionFailure extends Failure {
  ConnectionFailure([this.message]);

  final String? message;
}

class SessionExpiredFailure extends Failure {
  SessionExpiredFailure([this.message]);

  final String? message;
}

class PermissionFailure extends Failure {
  PermissionFailure([this.message]);

  final String? message;
}

String mapFailureToMessage(Failure failure) {
  late final String failureMessage;

  switch (failure.runtimeType) {
    case const (ServerFailure):
      failure as ServerFailure;
      failureMessage = failure.message ?? serverFailureMessage;
      break;
    case const (NetworkFailure):
      failure as NetworkFailure;
      failureMessage = failure.message ?? networkFailureMessage;
      break;
    case const (ConnectionFailure):
      failure as ConnectionFailure;
      failureMessage = failure.message ?? connectionFailureMessage;
      break;
    case const (CacheFailure):
      failure as CacheFailure;
      failureMessage = failure.message ?? cacheFailureMessage;
      break;
    case const (SessionExpiredFailure):
      failure as SessionExpiredFailure;
      failureMessage = failure.message ?? sessionExpiredFailureMessage;
      break;
    case const (PermissionFailure):
      failure as PermissionFailure;
      failureMessage = failure.message ?? permissionFailureMessage;
      break;
    default:
      failureMessage = 'Terjadi kesalahan';
      break;
  }

  return failureMessage;
}
