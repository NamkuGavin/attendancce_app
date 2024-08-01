import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../theme/color_value.dart';
import '../../theme/text_style.dart';

class CustomProfile extends StatefulWidget {
  final String level;
  const CustomProfile({super.key, required this.level});

  @override
  State<CustomProfile> createState() => _CustomProfileState();
}

class _CustomProfileState extends State<CustomProfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125.w,
      height: 40.h,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF00470F).withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, 4), // changes position of shadow
            ),
          ],
          color: ColorValue.primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(9999))),
      child: Row(
        children: [
          Expanded(
              child: Center(
                  child: Text(
            widget.level,
            style: TextThemeData.getTextTheme(
                Colors.white, 12.sp, FontWeight.w500),
          ))),
          Container(
            height: 40.h,
            width: 40.w,
            padding: EdgeInsets.only(top: 12.h),
            decoration: const BoxDecoration(
                color: ColorValue.darkGreen,
                borderRadius: BorderRadius.all(Radius.circular(9999))),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(9999)),
                child: SvgPicture.asset("assets/icons/default_profile.svg")),
          )
        ],
      ),
    );
  }
}
