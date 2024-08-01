import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/bloc/observer/app_bloc_observer.dart';
import 'core/bloc/provider/provider.dart';
import 'core/theme/app_style.dart';
import 'core/theme/app_theme_data.dart';
import 'core/widget/auth/authentication_page.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize service locator
  await initializeServiceLocator();

  // Initialize Flutter Downloader
  await FlutterDownloader.initialize(debug: true, ignoreSsl: true);

  // Others
  Bloc.observer = AppBlocObserver();
  deviceOrientation();
  statusBarDarkStyle();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: Provider.providers(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (_, child) {
          return MaterialApp(
            title: 'Attendance APP',
            debugShowCheckedModeBanner: false,
            theme: AppThemeData.getThemeLight(),
            home: child,
          );
        },
        child: const AuthenticationPage(),
      ),
    );
  }
}
