// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:lottie/lottie.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../../../core/route/navigate.dart';
//
// class SuccessPage extends StatelessWidget {
//   const SuccessPage({Key? key, this.isFromPresence = true}) : super(key: key);
//
//   final bool isFromPresence;
//
//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     SystemChrome.setSystemUIOverlayStyle(
//       const SystemUiOverlayStyle(
//         statusBarColor: Colors.transparent,
//         statusBarIconBrightness: Brightness.dark,
//       ),
//     );
//
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               '${isFromPresence ? 'Presensi' : 'Izin'} Berhasil',
//               style: textTheme.headline2,
//             ),
//             SizedBox(
//               height: 15.h,
//             ),
//             Lottie.asset(
//               'assets/lottie/success.json',
//               width: 150.w,
//               repeat: false,
//             ),
//             SizedBox(
//               height: 30.h,
//             ),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 minimumSize: Size(200.w, 45.h),
//               ),
//               onPressed: () {
//                 context
//                     .read<PresenceInformationBloc>()
//                     .add(GetPresenceInformationRefreshEvent());
//                 Navigate.navigatorPushAndRemove(
//                   context,
//                   const BottomNavigation(),
//                 );
//               },
//               child: const Text('Kembali ke beranda'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
