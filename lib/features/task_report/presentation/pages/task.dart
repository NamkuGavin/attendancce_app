import 'package:attendance_app/features/task_report/data/data_sources/dummy_task.dart';
import 'package:attendance_app/features/task_report/presentation/widget/task_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/color_value.dart';
import '../../../../core/theme/text_style.dart';
import '../../../../core/widget/appbar/custom_appbar.dart';

class TaskReportPage extends StatefulWidget {
  const TaskReportPage({super.key});

  @override
  State<TaskReportPage> createState() => _TaskReportPageState();
}

class _TaskReportPageState extends State<TaskReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Task report'),
      body: _body(),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Current task period',
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
              itemCount: DummyTask.taskReports.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return TaskItem(taskReport: DummyTask.taskReports[index]);
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
              'Tomorrow is the last day of this task period. Make sure your all task is already reported all!',
              style: TextThemeData.getTextTheme(
                  const Color(0xFF505050), 12.sp, FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
