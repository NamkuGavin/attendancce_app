import 'package:attendance_app/core/theme/color_value.dart';
import 'package:attendance_app/core/theme/text_style.dart';
import 'package:attendance_app/features/history/data/data_sources/dummy_history.dart';
import 'package:attendance_app/features/history/presentation/widget/history_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/widget/appbar/custom_appbar.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Attendance History'),
      body: _body(),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Current attendance period',
              style: TextThemeData.getTextTheme(
                  ColorValue.textGreyColor, 16.sp, FontWeight.w500)),
          SizedBox(height: 12.sp),
          Text('Jul 01 - 31, 2024',
              style: TextThemeData.getTextTheme(
                  Colors.black, 16.sp, FontWeight.w600)),
          SizedBox(height: 12.sp),
          _infoBox(),
          SizedBox(height: 15.sp),
          Expanded(
            child: ListView.builder(
              itemCount: Dummy.attendanceHistory.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return HistoryItem(attendance: Dummy.attendanceHistory[index]);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _infoBox() {
    return Container(
      width: double.infinity,
      color: ColorValue.secondaryColor,
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset("assets/icons/noteTime.svg"),
          SizedBox(width: 8.sp),
          Expanded(
            child: Text(
              'Tomorrow is the last day of this attendance period. Make sure your attendance is complete!',
              style: TextThemeData.getTextTheme(
                  const Color(0xFF505050), 12.sp, FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
