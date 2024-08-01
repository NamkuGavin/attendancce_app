import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/login.dart';
import '../../domain/repositories/login_repository.dart';
import '../data_sources/login_local_data_source.dart';
import '../data_sources/login_remote_data_source.dart';

class LoginRepositoryImpl implements LoginRepository {
  const LoginRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final LoginRemoteDataSource remoteDataSource;
  final LoginLocalDataSource localDataSource;

  @override
  Future<Either<Failure, Login>> postLogin(String niy, password) async {
    try {
      final model = await remoteDataSource.postLogin(niy, password);
      localDataSource.cacheLoginHistory(model);
      return Right(model);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException {
      return Left(NetworkFailure());
    } on ConnectionException {
      return Left(ConnectionFailure());
    }
  }
}
