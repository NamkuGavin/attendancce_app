import 'package:attendance_app/core/theme/color_value.dart';
import 'package:attendance_app/core/theme/text_style.dart';
import 'package:attendance_app/features/task_report/presentation/pages/detail_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/route/navigate.dart';
import '../../data/models/model_dummy_task.dart';

class TaskItem extends StatefulWidget {
  final TaskReport taskReport;

  const TaskItem({super.key, required this.taskReport});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigate.navigatorPush(
          context, DetailTaskPage(data: widget.taskReport)),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: ColorValue.secondaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text('Type: ${widget.taskReport.taskType}',
                        style: TextThemeData.getTextTheme(
                            ColorValue.primaryColor, 8.sp, FontWeight.w600)),
                  ),
                  Row(
                    children: [
                      Text(
                        widget.taskReport.status == "already"
                            ? "Already report"
                            : "No report yet",
                        style: TextThemeData.getTextTheme(
                            widget.taskReport.status == "already"
                                ? ColorValue.standByColor
                                : ColorValue.pendingColor,
                            10.sp,
                            FontWeight.w600),
                      ),
                      SizedBox(width: 4.w),
                      Icon(Icons.circle,
                          color: widget.taskReport.status == "already"
                              ? ColorValue.standByColor
                              : ColorValue.pendingColor,
                          size: 10),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Text(widget.taskReport.taskName,
                  style: TextThemeData.getTextTheme(
                      Colors.black, 14.sp, FontWeight.w700)),
              SizedBox(height: 8.h),
              Text(widget.taskReport.taskDetail,
                  style: TextThemeData.getTextTheme(
                      ColorValue.greyColor, 12.sp, FontWeight.w500)),
              SizedBox(height: 25.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset('assets/icons/markPin.svg'),
                  SizedBox(width: 8.h),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.taskReport.taskLocation,
                          style: TextThemeData.getTextTheme(
                              Colors.black, 10.sp, FontWeight.w600),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          '${widget.taskReport.taskDate} | ${widget.taskReport.startTime} - ${widget.taskReport.endTime}',
                          style: TextThemeData.getTextTheme(
                              ColorValue.greyColor, 10.sp, FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
