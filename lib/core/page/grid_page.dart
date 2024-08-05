import 'package:attendance_app/core/widget/auth/broken_page.dart';
import 'package:attendance_app/features/task_report/presentation/pages/task.dart';
import 'package:flutter/material.dart';

class GridPage {
  static Widget getPage(int index) {
    switch (index) {
      case 0:
        return const TaskReportPage();
      default:
        return const BrokenPage();
    }
  }
}
