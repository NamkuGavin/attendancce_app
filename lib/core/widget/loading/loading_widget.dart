import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.params = false});

  final bool? params; // khusus buat loading 1 page
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: params! ? Colors.white : Colors.white.withOpacity(0.55),
      child: Center(
        child: Lottie.asset(
          'assets/lottie/loading.json',
          width: 180.w,
        ),
      ),
    );
  }
}
