import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/app_style.dart';

PreferredSize transparentAppBarWidget({bool isDarkStyle = true}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(0),
    child: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle:
          isDarkStyle ? systemUiOverlayDarkStyle : systemUiOverlayLightStyle,
    ),
  );
}

PreferredSize customAppBarWidget() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(0),
    child: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    ),
  );
}
