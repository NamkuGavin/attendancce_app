import 'package:attendance_app/features/presence/bloc/location/location_bloc.dart';
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
        create: (_) => sl.get<LocationBloc>(),
      ),
    ];
  }
}
