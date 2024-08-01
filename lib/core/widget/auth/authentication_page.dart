import 'package:attendance_app/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:safe_device/safe_device.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../features/login/presentation/pages/login_page.dart';
import '../../constant/constant.dart';
import '../loading/loading_widget.dart';
import 'broken_page.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  Future _initialize() async {
    final isJailBroken = await SafeDevice.isJailBroken;
    final preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString(cachedBearerToken);

    if (mounted) {
      if (isJailBroken) {
        _navigate(child: const BrokenPage());
      } else if (token == null) {
        _navigate(child: const HomePage());
      } else {
        _navigate(child: const HomePage());
      }
    }
  }

  void _navigate({required Widget child}) {
    Navigator.pushAndRemoveUntil(
      context,
      PageTransition(
        type: PageTransitionType.fade,
        child: child,
      ),
      (route) => false,
    );
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: LoadingWidget(),
      ),
    );
  }
}
