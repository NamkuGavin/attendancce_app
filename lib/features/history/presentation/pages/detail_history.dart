import 'package:attendance_app/core/theme/color_value.dart';
import 'package:attendance_app/features/history/data/models/model_dummy_history.dart';
import 'package:attendance_app/features/history/presentation/widget/highlight_card.dart';
import 'package:attendance_app/features/history/presentation/widget/item_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/text_style.dart';
import '../../../../core/widget/appbar/custom_appbar.dart';

class DetailHistoryPage extends StatefulWidget {
  final Attendance data;
  const DetailHistoryPage({super.key, required this.data});

  @override
  State<DetailHistoryPage> createState() => _DetailHistoryPageState();
}

class _DetailHistoryPageState extends State<DetailHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: 'Attendance details'),
      body: Column(
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
      color: widget.data.status == "approved"
          ? ColorValue.secondaryColor
          : widget.data.status == "rejected"
              ? ColorValue.bgRejected
              : ColorValue.bgPending,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Row(
          children: [
            Icon(Icons.circle,
                color: widget.data.status == "approved"
                    ? ColorValue.validColor
                    : widget.data.status == "rejected"
                        ? ColorValue.invalidColor
                        : ColorValue.pendingColor,
                size: 14.h),
            SizedBox(width: 12.w),
            Text(
                widget.data.status == "approved"
                    ? 'Approved'
                    : widget.data.status == "rejected"
                        ? 'Rejected'
                        : 'Pending approval',
                style: TextThemeData.getTextTheme(
                    widget.data.status == "approved"
                        ? ColorValue.validColor
                        : widget.data.status == "rejected"
                            ? ColorValue.invalidColor
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HighlightCard(data: widget.data),
              SizedBox(height: 25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ItemDetail(
                      title: 'Overtime',
                      subtitle: widget.data.overtime,
                      isImage: false),
                  ItemDetail(
                      title: 'Clock In',
                      subtitle: widget.data.clockIn,
                      isImage: false),
                  ItemDetail(
                      title: 'Clock Out',
                      subtitle: widget.data.clockOut,
                      isImage: false),
                ],
              ),
              SizedBox(height: 25.h),
              ItemDetail(
                  title: 'Location',
                  subtitle: widget.data.location,
                  isImage: false),
              SizedBox(height: 25.h),
              const Divider(color: Color(0xFFD9D9D9), thickness: 1),
              SizedBox(height: 25.h),
              const ItemDetail(title: '', subtitle: '', isImage: true),
              SizedBox(height: 25.h),
              ItemDetail(
                  title: 'Note', subtitle: widget.data.note, isImage: false),
            ],
          ),
        ),
      ),
    );
  }
}
