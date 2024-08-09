import 'dart:ui';

import 'package:attendance_app/core/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';

Widget showDialogError(
  BuildContext context, {
  bool isServiceDisabled = false,
}) {
  final size = MediaQuery.of(context).size;
  final textTheme = Theme.of(context).textTheme;

  return BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
    child: Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        width: size.width * 0.8,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Warning',
                style: TextThemeData.getTextTheme(
                    Colors.black, 12.sp, FontWeight.w700)),
            SizedBox(
              height: 16.h,
            ),
            Text(
                isServiceDisabled
                    ? 'This app utilizes location information to record attendance.\n\nBy enabling this service, you consent to location sharing while using the app.'
                    : 'Location permit permanently denied, please allow first.',
                style: TextThemeData.getTextTheme(
                    Colors.black, 10.sp, FontWeight.w500)),
            SizedBox(
              height: 24.h,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.grey,
                      minimumSize: Size(double.infinity, 40.h),
                    ),
                    child: const Text('Cancel'),
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: isServiceDisabled
                        ? () async {
                            await Geolocator.openLocationSettings()
                                .whenComplete(
                              () => Navigator.pop(context),
                            );
                          }
                        : () async {
                            await Geolocator.openAppSettings().whenComplete(
                              () => Navigator.pop(context),
                            );
                          },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      minimumSize: Size(double.infinity, 40.h),
                    ),
                    child: Text(isServiceDisabled ? 'Activate' : 'Allow'),
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
