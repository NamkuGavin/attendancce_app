import 'dart:io';

import 'package:attendance_app/features/task_report/bloc/camera_task/camera_task_bloc.dart';
import 'package:attendance_app/features/task_report/bloc/location_task/location_task_bloc.dart';
import 'package:attendance_app/features/task_report/bloc/location_task/location_task_bloc.dart';
import 'package:attendance_app/features/task_report/bloc/location_task/location_task_state.dart';
import 'package:attendance_app/features/task_report/data/models/model_dummy_task.dart';
import 'package:attendance_app/features/task_report/presentation/pages/preview.dart';
import 'package:attendance_app/features/task_report/presentation/widget/item_detail.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theme/app_style.dart';
import '../../../../core/theme/color_value.dart';
import '../../../../core/theme/text_style.dart';
import '../../../../core/widget/appbar/custom_appbar.dart';
import '../../../../core/widget/text_form_field/custom_text_form_field.dart';
import '../../bloc/location_task/location_task_event.dart';
import 'camera.dart';

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
              _camera(),
              SizedBox(height: widget.data.status == "already" ? 0.h : 15.h),
              Text(
                widget.data.status == "already" ? '' : 'Add notes (optional)',
                style: TextThemeData.getTextTheme(
                    Colors.black, 16.sp, FontWeight.w600),
              ),
              SizedBox(height: 8.h),
              widget.data.status == "already"
                  ? const ItemTaskDetail(
                      title: 'Notes', subtitle: "N/A", isImage: false)
                  : CustomTextFormField(
                      label: 'Enter notes',
                      controller: _notesController,
                      textInputType: TextInputType.text,
                    ),
              SizedBox(height: widget.data.status == "already" ? 0.h : 15.h),
              widget.data.status == "already"
                  ? Container()
                  : ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50.h)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/icons/report.svg"),
                          SizedBox(width: 10.w),
                          const Text('Report your assignment results')
                        ],
                      )),
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
      subtitle: BlocBuilder<LocationTaskBloc, LocationTaskState>(
        builder: (context, state) {
          if (state is LocationChecking) {
            return Row(
              children: [
                Icon(Icons.circle, color: ColorValue.standByColor, size: 15.h),
                SizedBox(width: 8.w),
                Text('Checking...',
                    style: TextThemeData.getTextTheme(
                        ColorValue.standByColor, 14.sp, FontWeight.w600))
              ],
            );
          } else if (state is LocationValid) {
            return Row(
              children: [
                Icon(Icons.circle, color: ColorValue.validColor, size: 15.h),
                SizedBox(width: 8.w),
                Text('Valid in the area',
                    style: TextThemeData.getTextTheme(
                        ColorValue.validColor, 14.sp, FontWeight.w600))
              ],
            );
          } else if (state is LocationInvalid) {
            return Row(
              children: [
                Icon(Icons.circle, color: ColorValue.invalidColor, size: 15.h),
                SizedBox(width: 8.w),
                Text('Invalid outside area',
                    style: TextThemeData.getTextTheme(
                        ColorValue.invalidColor, 14.sp, FontWeight.w600))
              ],
            );
          } else if (state is LocationError) {
            return Row(
              children: [
                Icon(Icons.circle, color: Colors.red, size: 15.h),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(state.message,
                      style: TextThemeData.getTextTheme(
                          Colors.red, 14.sp, FontWeight.w600)),
                )
              ],
            );
          }
          return Row(
            children: [
              Icon(Icons.circle, color: ColorValue.validColor, size: 15.h),
              SizedBox(width: 8.w),
              Text('Valid in the area',
                  style: TextThemeData.getTextTheme(
                      ColorValue.validColor, 14.sp, FontWeight.w600))
            ],
          );
        },
      ),
      trailing: widget.data.status == "already"
          ? null
          : ElevatedButton(
              onPressed: () =>
                  context.read<LocationTaskBloc>().add(CheckLocation(context)),
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

  Widget _camera() {
    return BlocConsumer<CameraTaskBloc, CameraTaskState>(
      listener: (context, state) {
        if (state is CameraPictureTaken) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PreviewPage(imagePath: state.imagePath),
            ),
          ).then((result) {
            if (result != null) {
              Navigator.pop(context, result);
            } else {
              context.read<CameraTaskBloc>().add(InitializeCameraEvent());
            }
          });
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Image proof of your assignment',
                style: TextThemeData.getTextTheme(
                    ColorValue.greyColor, 14.sp, FontWeight.w500)),
            SizedBox(height: 8.h),
            Text(
                'It can be a photo of your assignment or a selfie of you with your assignment.',
                style: TextThemeData.getTextTheme(
                    Colors.black, 12.sp, FontWeight.w600)),
            SizedBox(height: 12.h),
            state is CameraPictureTaken
                ? Container(
                    height: 200.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: FileImage(File(state.imagePath))),
                    ),
                  )
                : GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CameraPage(),
                      ),
                    ).whenComplete(
                      () => statusBarDarkStyle(),
                    ),
                    child: SizedBox(
                      height: 200.h,
                      width: double.infinity,
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(12),
                        dashPattern: const [12],
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/icons/camera.svg',
                                    height: 50.h, width: 50.h),
                                SizedBox(height: 10.h),
                                Text('Take a picture',
                                    style: TextThemeData.getTextTheme(
                                        Colors.black, 14.sp, FontWeight.w500)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        );
      },
    );
  }
}
