import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/color_value.dart';
import '../../../../core/theme/text_style.dart';
import '../../data/models/model_dummy_history.dart';

class HighlightCard extends StatefulWidget {
  final Attendance data;
  const HighlightCard({super.key, required this.data});

  @override
  State<HighlightCard> createState() => _HighlightCardState();
}

class _HighlightCardState extends State<HighlightCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      width: double.infinity,
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage("assets/illustrations/bg_detailAttendance.png"),
              fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.data.date,
              style: TextThemeData.getTextTheme(
                  ColorValue.greyColor, 12.sp, FontWeight.w500)),
          SizedBox(height: 8.h),
          Text(widget.data.totalHours,
              style: TextThemeData.getTextTheme(
                  Colors.black, 18.sp, FontWeight.bold)),
          SizedBox(height: 8.h),
          Text(widget.data.workTime,
              style: TextThemeData.getTextTheme(
                  Colors.black, 12.sp, FontWeight.w500)),
        ],
      ),
    );
  }
}
