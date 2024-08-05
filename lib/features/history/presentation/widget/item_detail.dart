import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/color_value.dart';
import '../../../../core/theme/text_style.dart';

class ItemDetail extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool isImage;
  const ItemDetail(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.isImage});

  @override
  State<ItemDetail> createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  @override
  Widget build(BuildContext context) {
    return widget.isImage
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: 20.h, height: 5.w, color: ColorValue.primaryColor),
              SizedBox(height: 8.h),
              Text('Image',
                  style: TextThemeData.getTextTheme(
                      ColorValue.greyColor, 14.sp, FontWeight.w500)),
              SizedBox(height: 8.h),
              Image.asset("assets/illustrations/imageAttendance.png", scale: 0.8),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: 20.h, height: 5.w, color: ColorValue.primaryColor),
              SizedBox(height: 8.h),
              Text(widget.title,
                  style: TextThemeData.getTextTheme(
                      ColorValue.greyColor, 14.sp, FontWeight.w500)),
              SizedBox(height: 8.h),
              Text(widget.subtitle,
                  style: TextThemeData.getTextTheme(
                      Colors.black, 14.sp, FontWeight.w600)),
            ],
          );
  }
}
