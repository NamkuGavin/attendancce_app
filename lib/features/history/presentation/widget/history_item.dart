import 'package:attendance_app/core/theme/color_value.dart';
import 'package:attendance_app/core/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/models/model_dummy_history.dart';

class HistoryItem extends StatefulWidget {
  final Attendance attendance;
  const HistoryItem({super.key, required this.attendance});

  @override
  State<HistoryItem> createState() => _HistoryItemState();
}

class _HistoryItemState extends State<HistoryItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                '${widget.attendance.date} | ${widget.attendance.clockIn} - ${widget.attendance.clockOut}',
                style: TextThemeData.getTextTheme(
                    Colors.black, 11.sp, FontWeight.w400)),
            SizedBox(height: 8.sp),
            Row(
              children: [
                SvgPicture.asset('assets/icons/markPin.svg'),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(widget.attendance.location,
                      style: TextThemeData.getTextTheme(
                          ColorValue.greyColor, 11.sp, FontWeight.w400)),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.attendance.totalHours,
                  style: TextThemeData.getTextTheme(
                      Colors.black, 12.sp, FontWeight.w600),
                ),
                if (widget.attendance.status == "approved" ||
                    widget.attendance.status == "rejected")
                  Row(
                    children: [
                      Text(
                        widget.attendance.status == "approved"
                            ? 'Approved'
                            : 'Rejected',
                        style: TextThemeData.getTextTheme(
                            widget.attendance.status == "approved"
                                ? ColorValue.validColor
                                : ColorValue.invalidColor,
                            10.sp,
                            FontWeight.w500),
                      ),
                      SizedBox(width: 4.w),
                      Icon(
                        Icons.circle,
                        color: widget.attendance.status == "approved"
                            ? ColorValue.validColor
                            : ColorValue.invalidColor,
                        size: 10.h,
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
