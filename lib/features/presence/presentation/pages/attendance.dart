import 'package:attendance_app/core/route/navigate.dart';
import 'package:attendance_app/core/theme/color_value.dart';
import 'package:attendance_app/core/theme/text_style.dart';
import 'package:attendance_app/core/widget/appbar/custom_appbar.dart';
import 'package:attendance_app/core/widget/separator_line/separator.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/widget/snackbar/snackbar_item.dart';
import '../../bloc/location/location_bloc.dart';
import '../../bloc/location/location_event.dart';
import '../../bloc/location/location_state.dart';
import '../widgets/show_dialog_error.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Attendance'),
      body: _body(),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _clockInOutButton(),
          SizedBox(height: 20.h),
          _dateTime(),
          SizedBox(height: 20.h),
          const CustomSeparator(color: Color(0xFFC3C3C3)),
          SizedBox(height: 20.h),
          ListTile(
            dense: true,
            contentPadding: const EdgeInsets.only(left: 0, right: 0),
            title: Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Text('Location',
                  style: TextThemeData.getTextTheme(
                      ColorValue.greyColor, 14.sp, FontWeight.w500)),
            ),
            subtitle: Text(
                'Sukun Raya Street No.09, Besito Kulon, Besito, Gebog Sub-district, Kudus Regency, Central Java 59333',
                style: TextThemeData.getTextTheme(
                    Colors.black, 14.sp, FontWeight.w600)),
          ),
          SizedBox(height: 12.h),
          _locationCheck(),
          SizedBox(height: 20.h),
          const CustomSeparator(color: Color(0xFFC3C3C3)),
          ListTile(
            dense: true,
            contentPadding: const EdgeInsets.only(left: 0, right: 0),
            title: Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Text('Image proof for attendance',
                  style: TextThemeData.getTextTheme(
                      ColorValue.greyColor, 14.sp, FontWeight.w500)),
            ),
            subtitle: Text(
                'Try to keep the workplace within the area and not work where it is not supposed to be.',
                style: TextThemeData.getTextTheme(
                    Colors.black, 14.sp, FontWeight.w600)),
          ),
          SizedBox(height: 12.h),
          _camera()
        ],
      ),
    );
  }

  Widget _clockInOutButton() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 75.h)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/clock_in.svg"),
                  SizedBox(width: 10.w),
                  const Text('Clock In')
                ],
              )),
        ),
        SizedBox(width: 25.w),
        Expanded(
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 75.h)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/clock_out.svg"),
                  SizedBox(width: 10.w),
                  Text(
                    'Clock Out',
                    style: TextThemeData.getTextTheme(
                        ColorValue.primaryColor, 15.sp, FontWeight.w600),
                  )
                ],
              )),
        ),
      ],
    );
  }

  Widget _dateTime() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ListTile(
            dense: true,
            contentPadding: const EdgeInsets.only(left: 0, right: 0),
            title: Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Text('Date',
                  style: TextThemeData.getTextTheme(
                      ColorValue.greyColor, 14.sp, FontWeight.w500)),
            ),
            subtitle: Text('Sunday, July 21 2024',
                style: TextThemeData.getTextTheme(
                    Colors.black, 14.sp, FontWeight.w600)),
          ),
        ),
        SizedBox(width: 25.w),
        Expanded(
          child: ListTile(
            dense: true,
            contentPadding: const EdgeInsets.only(left: 0, right: 0),
            title: Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Text('Time',
                  style: TextThemeData.getTextTheme(
                      ColorValue.greyColor, 14.sp, FontWeight.w500)),
            ),
            subtitle: Text('09.00 AM - 05.00 PM',
                style: TextThemeData.getTextTheme(
                    Colors.black, 14.sp, FontWeight.w600)),
          ),
        ),
      ],
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
      subtitle: BlocBuilder<LocationBloc, LocationState>(
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
                Text(state.message,
                    style: TextThemeData.getTextTheme(
                        Colors.red, 14.sp, FontWeight.w600))
              ],
            );
          }
          return Row(
            children: [
              Icon(Icons.circle, color: Colors.grey, size: 15.h),
              SizedBox(width: 8.w),
              Text('Tap to check',
                  style: TextThemeData.getTextTheme(
                      Colors.grey, 14.sp, FontWeight.w600))
            ],
          );
        },
      ),
      trailing: ElevatedButton(
          onPressed: () =>
              context.read<LocationBloc>().add(CheckLocation(context)),
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
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(12),
          dashPattern: const [12],
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
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
    );
  }
}
