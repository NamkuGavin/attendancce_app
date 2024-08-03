import 'package:attendance_app/core/theme/color_value.dart';
import 'package:attendance_app/core/widget/appbar/custom_appbar.dart';
import 'package:attendance_app/features/history/presentation/pages/history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/route/navigate.dart';
import '../../../../core/theme/text_style.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Profile'),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            _profileCard(),
            SizedBox(height: 25.h),
            ElevatedButton(
              onPressed: () {
                Navigate.navigatorPush(context, const HistoryPage());
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(
                      color: ColorValue.borderGreyColor, width: 0.5)),
              child: ListTile(
                minLeadingWidth: 0,
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                leading: SvgPicture.asset("assets/icons/history.svg"),
                trailing:
                    const Icon(Icons.arrow_forward_ios, color: Colors.black),
                title: Text('Attendance History',
                    style: TextThemeData.getTextTheme(
                        Colors.black, 16.sp, FontWeight.w500)),
              ),
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(
                      color: ColorValue.borderGreyColor, width: 0.5)),
              child: ListTile(
                minLeadingWidth: 0,
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                leading: SvgPicture.asset("assets/icons/logout.svg"),
                title: Text('Log out',
                    style: TextThemeData.getTextTheme(
                        Colors.red, 16.sp, FontWeight.w500)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileCard() {
    return Card(
      color: ColorValue.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 40.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 100.w,
              height: 100.h,
              padding: EdgeInsets.only(top: 12.h),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  color: ColorValue.darkGreen,
                  borderRadius: const BorderRadius.all(Radius.circular(9999))),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(9999)),
                  child:
                      SvgPicture.asset("assets/icons/default_profile_big.svg")),
            ),
            SizedBox(width: 25.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Aji Suryawan',
                      style: TextThemeData.getTextTheme(
                          Colors.white, 20.sp, FontWeight.bold)),
                  SizedBox(height: 20.h),
                  Text('2763286382638',
                      style: TextThemeData.getTextTheme(
                          Colors.white, 16.sp, FontWeight.w500)),
                  SizedBox(height: 20.h),
                  Text('Manager',
                      style: TextThemeData.getTextTheme(
                          Colors.white, 16.sp, FontWeight.bold)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
