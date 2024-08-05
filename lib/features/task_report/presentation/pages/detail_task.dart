import 'package:attendance_app/features/task_report/data/models/model_dummy_task.dart';
import 'package:attendance_app/features/task_report/presentation/widget/item_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/color_value.dart';
import '../../../../core/theme/text_style.dart';
import '../../../../core/util/validator/input_validator.dart';
import '../../../../core/widget/appbar/custom_appbar.dart';
import '../../../../core/widget/text_form_field/custom_text_form_field.dart';

class DetailTaskPage extends StatefulWidget {
  final TaskReport data;
  const DetailTaskPage({super.key, required this.data});

  @override
  State<DetailTaskPage> createState() => _DetailTaskPageState();
}

class _DetailTaskPageState extends State<DetailTaskPage> {
  final TextEditingController _notesController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Task details'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _statusBar(),
          _body(),
        ],
      ),
    );
  }

  Widget _statusBar() {
    return Container(
      width: double.infinity,
      color: widget.data.status == "already"
          ? ColorValue.bgStandby
          : ColorValue.bgPending,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Row(
          children: [
            Icon(Icons.circle,
                color: widget.data.status == "already"
                    ? ColorValue.standByColor
                    : ColorValue.pendingColor,
                size: 14.h),
            SizedBox(width: 12.w),
            Text(
                widget.data.status == "already"
                    ? 'Already report'
                    : 'No report yet',
                style: TextThemeData.getTextTheme(
                    widget.data.status == "already"
                        ? ColorValue.standByColor
                        : ColorValue.pendingColor,
                    14.sp,
                    FontWeight.w600)),
          ],
        ),
      ),
    );
  }

  Widget _body() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.data.taskName,
                  style: TextThemeData.getTextTheme(
                      Colors.black, 20.sp, FontWeight.w700)),
              SizedBox(height: 25.h),
              Row(
                children: [
                  ItemTaskDetail(
                      title: 'Date',
                      subtitle: widget.data.taskDate,
                      isImage: false),
                  SizedBox(width: 50.w),
                  ItemTaskDetail(
                      title: 'Type',
                      subtitle: widget.data.taskType,
                      isImage: false),
                ],
              ),
              SizedBox(height: 15.h),
              const Divider(color: Color(0xFFD9D9D9), thickness: 1),
              SizedBox(height: 15.h),
              ItemTaskDetail(
                  title: 'Time',
                  subtitle: '${widget.data.startTime} - ${widget.data.endTime}',
                  isImage: false),
              SizedBox(height: 15.h),
              const Divider(color: Color(0xFFD9D9D9), thickness: 1),
              SizedBox(height: 15.h),
              ItemTaskDetail(
                  title: 'Location',
                  subtitle: widget.data.taskLocation,
                  isImage: false),
              SizedBox(height: 12.h),
              _locationCheck(),
              SizedBox(height: 15.h),
              const Divider(color: Color(0xFFD9D9D9), thickness: 1),
              SizedBox(height: 15.h),
              const ItemTaskDetail(title: '', subtitle: '', isImage: true),
              SizedBox(height: 15.h),
              Text(
                'Add notes (optional)',
                style: TextThemeData.getTextTheme(
                    Colors.black, 16.sp, FontWeight.w600),
              ),
              SizedBox(height: 8.h),
              CustomTextFormField(
                label: 'Enter notes',
                controller: _notesController,
                textInputType: TextInputType.text,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _locationCheck() {
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.only(left: 0, right: 0),
      title: Padding(
        padding: EdgeInsets.only(bottom: 8.h),
        child: Text('Check your position',
            style: TextThemeData.getTextTheme(
                ColorValue.greyColor, 14.sp, FontWeight.w500)),
      ),
      subtitle: Row(
        children: [
          Icon(Icons.circle, color: ColorValue.validColor, size: 15.h),
          SizedBox(width: 8.w),
          Text('Valid in the area',
              style: TextThemeData.getTextTheme(
                  ColorValue.validColor, 14.sp, FontWeight.w600))
        ],
      ),
      trailing: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              side: const BorderSide(
                  width: 0.25, color: ColorValue.borderGreyColor),
              minimumSize: Size.zero,
              padding: EdgeInsets.zero,
              backgroundColor: Colors.white),
          child: Padding(
            padding: EdgeInsets.all(8.h),
            child: SvgPicture.asset("assets/icons/location.svg"),
          )),
    );
  }
}
