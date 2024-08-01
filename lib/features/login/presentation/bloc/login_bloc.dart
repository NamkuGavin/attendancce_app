import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/login.dart';
import '../../domain/use_cases/post_login.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required PostLogin postLogin})
      : _postLogin = postLogin,
        super(LoginInitial()) {
    on<PostLoginEvent>(_postLoginHandler);
  }

  final PostLogin _postLogin;

  Future<void> _postLoginHandler(
    PostLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    final params = Params(niy: event.niy, password: event.password);
    final either = await _postLogin(params);

    _emitLoginResult(either, emit);
  }

  Future<void> _emitLoginResult(
    Either<Failure, Login> either,
    Emitter<LoginState> emit,
  ) async {
    await either.fold(
      (failure) async {
        emit(
          LoginFailure(
            message: mapFailureToMessage(failure),
          ),
        );
      },
      (_) {
        emit(
          LoginSuccess(),
        );
      },
    );
  }
}
