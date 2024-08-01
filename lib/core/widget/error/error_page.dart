// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../features/login/presentation/pages/login_page.dart';
// import '../../constant/constant.dart';
// import '../../route/navigate.dart';
//
// class ErrorPage extends StatelessWidget {
//   const ErrorPage({
//     Key? key,
//     required this.message,
//     required this.onPressed,
//   }) : super(key: key);
//
//   final String message;
//   final void Function() onPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 30.w),
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   'assets/illustrations/$_illustration',
//                   width: 128.w,
//                   height: 128.h,
//                 ),
//                 SizedBox(height: 24.h),
//                 Text(
//                   _title,
//                   style: textTheme.headline3,
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(
//                   height: 8.h,
//                 ),
//                 Text(
//                   _description,
//                   style: textTheme.bodyText2,
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(
//                   height: 24.h,
//                 ),
//                 BlocListener<LogoutBloc, LogoutState>(
//                   listener: (context, state) {
//                     if (state is LogoutSuccess) {
//                       Navigate.navigatorPushAndRemove(
//                         context,
//                         const LoginPage(),
//                       );
//                     }
//                   },
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: Size(double.infinity, 44.h),
//                     ),
//                     onPressed: message == sessionExpiredFailureMessage
//                         ? () {
//                             context.read<LogoutBloc>().add(ForceLogoutEvent());
//                           }
//                         : onPressed,
//                     child: Text(
//                       message == sessionExpiredFailureMessage
//                           ? 'Login'
//                           : 'Muat Ulang',
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   String get _title {
//     switch (message) {
//       case sessionExpiredFailureMessage:
//         return 'Sesi Anda telah berakhir';
//       case serverFailureMessage:
//         return 'Kesalahan teknis';
//       case cacheFailureMessage:
//         return 'Data tidak ditemukan';
//       case networkFailureMessage:
//         return 'Tidak ada koneksi internet';
//       case connectionFailureMessage:
//         return 'Tidak masalah koneksi';
//       default:
//         return 'Terjadi kesalahan';
//     }
//   }
//
//   String get _description {
//     switch (message) {
//       case sessionExpiredFailureMessage:
//         return 'Sesi Anda telah berakhir. Silakan login kembali untuk  menggunakan aplikasi';
//       case serverFailureMessage:
//         return 'Kami sedang bekerja untuk memperbaikinya. Silakan coba lagi nanti.';
//       case cacheFailureMessage:
//         return 'Terjadi masalah lokal, silahkan coba lagi';
//       case networkFailureMessage:
//         return 'Sepertinya kamu sedang offline, periksa koneksi internet anda, dan coba lagi';
//       case connectionFailureMessage:
//         return 'Terjadi masalah koneksi, silahkan coba lagi';
//       default:
//         return 'Terjadi kesalahan, silahkan coba lagi';
//     }
//   }
//
//   String get _illustration {
//     switch (message) {
//       case sessionExpiredFailureMessage:
//         return 'clock.png';
//       case serverFailureMessage:
//         return 'cloud_data.png';
//       case cacheFailureMessage:
//         return 'cloud_data.png';
//       case networkFailureMessage:
//         return 'disconnected.png';
//       case connectionFailureMessage:
//         return 'disconnected.png';
//       default:
//         return 'cloud_data.png';
//     }
//   }
// }
