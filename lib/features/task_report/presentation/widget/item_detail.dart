import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/color_value.dart';
import '../../../../core/theme/text_style.dart';

class ItemTaskDetail extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool isImage;
  const ItemTaskDetail(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.isImage});

  @override
  State<ItemTaskDetail> createState() => _ItemTaskDetailState();
}

class _ItemTaskDetailState extends State<ItemTaskDetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
