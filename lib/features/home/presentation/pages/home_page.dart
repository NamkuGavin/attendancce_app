import 'package:attendance_app/core/page/grid_page.dart';
import 'package:attendance_app/core/route/navigate.dart';
import 'package:attendance_app/core/theme/color_value.dart';
import 'package:attendance_app/core/theme/text_style.dart';
import 'package:attendance_app/core/widget/card/custom_profile.dart';
import 'package:attendance_app/features/presence/presentation/pages/attendance.dart';
import 'package:attendance_app/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/widget/card/custom_card.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../widget/pop_up_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late OverlayEntry _popup;

  final List<String> titles = [
    'Task report',
    'Paid/Unpaid leave',
    'Leaderboard',
    'Company agenda',
    'Message to other staff',
    'Pay slip detail',
  ];

  final List<String> image = [
    'assets/illustrations/taskReport.svg',
    'assets/illustrations/paidUnpaid.svg',
    'assets/illustrations/leaderboard.svg',
    'assets/illustrations/companyAgenda.svg',
    'assets/illustrations/message.svg',
    'assets/illustrations/paySlip.svg',
  ];

  _showPopup(BuildContext context) {
    void closePopup() {
      _popup.remove();
    }

    // Create and insert the popup
    _popup = showPopupDialog(50.w, 50.h, closePopup);
    Overlay.of(context).insert(_popup);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: BlocListener<NavigationBloc, NavigationState>(
          listener: (context, state) {
            if (state is PageLoaded) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GridPage.getPage(state.pageIndex)),
              );
            }
          },
          child: Stack(
            children: [
              _background(),
              _body(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _background() {
    return Container(
      height: 300.h,
      width: double.infinity,
      color: ColorValue.secondaryColor,
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
                onTap: () =>
                    Navigate.navigatorPush(context, const ProfilePage()),
                child: const CustomProfile(level: 'Manager')),
          ),
          Text('Good morning',
              style: TextThemeData.getTextTheme(
                  const Color(0xFF7E7E7E), 16.sp, FontWeight.w500)),
          SizedBox(height: 8.h),
          Text('Aji Suryawan',
              style: TextThemeData.getTextTheme(
                  Colors.black, 24.sp, FontWeight.w700)),
          SizedBox(height: 25.h),
          ElevatedButton(
              onPressed: () {
                Navigate.navigatorPush(context, const AttendancePage());
              },
              child: const Text('Employee Attendance')),
          SizedBox(height: 25.h),
          CustomCard(
            child: ListTile(
              minVerticalPadding: 20,
              title: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icons/work.svg"),
                    SizedBox(width: 10.w),
                    Text(
                      "You haven't clocked in yet",
                      style: TextThemeData.getTextTheme(
                          Colors.black, 14.sp, FontWeight.w600),
                    )
                  ],
                ),
              ),
              subtitle: Text(
                '--:-- Hrs',
                style: TextThemeData.getTextTheme(
                    Colors.black, 14.sp, FontWeight.w500),
              ),
            ),
          ),
          SizedBox(height: 25.h),
          Text('App Features',
              style: TextThemeData.getTextTheme(
                  Colors.black, 14.sp, FontWeight.w600)),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                childAspectRatio: 0.6,
              ),
              itemCount: titles.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      BlocProvider.of<NavigationBloc>(context)
                          .add(NavigateToPage(index));
                    } else {
                      _showPopup(context);
                    }
                    // _showPopup(context);
                  },
                  child: Column(
                    children: [
                      SizedBox(
                          height: 100.h,
                          child: CustomCard(
                              child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: SvgPicture.asset(image[index]),
                          ))),
                      SizedBox(height: 8.h),
                      Text(
                        titles[index],
                        textAlign: TextAlign.center,
                        style: TextThemeData.getTextTheme(
                            Colors.black, 12.sp, FontWeight.w500),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
