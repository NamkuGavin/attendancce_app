import 'dart:ui';

import 'package:attendance_app/core/theme/text_style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/widget/dialog/animated_dialog.dart';
import '../../../../../core/widget/loading/shimmer_widget.dart';

OverlayEntry showPopupDialog(
    double width, double height, VoidCallback onClose) {
  return OverlayEntry(
    builder: (context) => Stack(
      children: [
        const AbsorbPointer(
          absorbing: true,
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Center(
          child: AnimatedDialog(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: height / 8),
                child: Container(
                  width: 275.w,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset: const Offset(0, 4), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SvgPicture.asset(
                        'assets/illustrations/warning.svg',
                        height: 125.h,
                      ),
                      SizedBox(height: 20.h),
                      DefaultTextStyle(
                        style: TextThemeData.getTextTheme(
                            Colors.black, 20.sp, FontWeight.w700),
                        child: const Text('Uh oh!'),
                      ),
                      SizedBox(height: 10.h),
                      DefaultTextStyle(
                        style: TextThemeData.getTextTheme(
                            Colors.black, 12.sp, FontWeight.w500),
                        child: const Text(
                            'This feature cannot be opened. Please contact develop this application or admin',
                            textAlign: TextAlign.center),
                      ),
                      SizedBox(height: 20.h),
                      ElevatedButton(
                          onPressed: onClose, child: const Text('Ok')),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
