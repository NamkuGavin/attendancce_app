import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../route/navigate.dart';
import '../../theme/text_style.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppbar({super.key, required this.title});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Navigate.navigatorPop(context);
          },
          icon: SvgPicture.asset("assets/icons/back.svg")),
      centerTitle: true,
      title: Text(widget.title,
          style:
              TextThemeData.getTextTheme(Colors.black, 16.sp, FontWeight.w500)),
    );
  }
}
