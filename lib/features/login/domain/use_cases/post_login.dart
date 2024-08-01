import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/use_case/use_case.dart';
import '../entities/login.dart';
import '../repositories/login_repository.dart';

class PostLogin implements UseCase<Login, Params> {
  const PostLogin(this.repository);

  final LoginRepository repository;

  @override
  Future<Either<Failure, Login>> call(Params params) async {
    return await repository.postLogin(params.niy, params.password);
  }
}

class Params extends Equatable {
  const Params({required this.niy, required this.password});

  final String niy, password;

  @override
  List<Object?> get props => [niy, password];
}