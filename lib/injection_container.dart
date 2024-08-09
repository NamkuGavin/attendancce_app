import 'package:attendance_app/features/presence/bloc/location_presence/location_presence_bloc.dart';
import 'package:attendance_app/features/task_report/bloc/camera_task/camera_task_bloc.dart';
import 'package:attendance_app/features/task_report/bloc/location_task/location_task_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/util/local/local_storage.dart';
import 'core/util/network/network_info.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/login/data/data_sources/login_local_data_source.dart';
import 'features/login/data/data_sources/login_remote_data_source.dart';
import 'features/login/data/repositories/login_repository_impl.dart';
import 'features/login/domain/repositories/login_repository.dart';
import 'features/login/domain/use_cases/post_login.dart';
import 'features/login/presentation/bloc/login_bloc.dart';

final sl = GetIt.I;

Future<void> initializeServiceLocator() async {
  /// Feature - Login
  _initializeLoginFeature();

  ///Feature - Home
  _initializeNavigationHomeFeature();

  ///Feature - Location Task
  _initializeTaskReportFeature();

  ///Feature - Location Presence
  _initializePresenceFeature();

  /// Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      sl(),
    ),
  );

  sl.registerLazySingleton<LocalStorage>(
    () => LocalStorageImpl(
      sharedPreferences: sl(),
    ),
  );

  /// External
  final sharedPreferences = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}

void _initializeLoginFeature() {
  // bloc
  sl.registerFactory(
    () => LoginBloc(
      postLogin: sl(),
    ),
  );

  // use case
  sl.registerLazySingleton(
    () => PostLogin(
      sl(),
    ),
  );

  // repository
  sl.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
    ),
  );

  // data sources
  sl.registerLazySingleton<LoginRemoteDataSource>(
    () => LoginRemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<LoginLocalDataSource>(
    () => LoginLocalDataSourceImpl(
      sharedPreferences: sl(),
    ),
  );
}

void _initializeNavigationHomeFeature() {
  // bloc
  sl.registerFactory(
    () => NavigationBloc(),
  );
}

void _initializeTaskReportFeature() {
  // bloc
  sl.registerFactory(
    () => CameraTaskBloc(),
  );

  sl.registerFactory(
    () => LocationTaskBloc(),
  );
}

void _initializePresenceFeature() {
  // bloc
  // sl.registerFactory(
  //   () => CameraBloc(),
  // );

  sl.registerFactory(
    () => LocationPresenceBloc(),
  );
}
