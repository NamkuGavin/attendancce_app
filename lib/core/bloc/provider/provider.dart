import 'package:attendance_app/features/presence/bloc/location_presence/location_presence_bloc.dart';
import 'package:attendance_app/features/task_report/bloc/camera_task/camera_task_bloc.dart';
import 'package:attendance_app/features/task_report/bloc/location_task/location_task_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/home/presentation/bloc/home_bloc.dart';
import '../../../features/login/presentation/bloc/login_bloc.dart';
import '../../../injection_container.dart';

class Provider {
  static providers() {
    return [
      BlocProvider(
        create: (_) => sl.get<LoginBloc>(),
      ),
      BlocProvider(
        create: (_) => sl.get<NavigationBloc>(),
      ),
      BlocProvider(
        create: (_) => sl.get<LocationTaskBloc>(),
      ),
      BlocProvider(
        create: (_) => sl.get<LocationPresenceBloc>(),
      ),
      BlocProvider(
        create: (_) => sl.get<CameraTaskBloc>(),
      ),
    ];
  }
}
