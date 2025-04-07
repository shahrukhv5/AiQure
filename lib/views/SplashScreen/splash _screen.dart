// import 'package:aiqure/models/UserModel/user_model.dart';
// import 'package:aiqure/services/api_service.dart';
// import 'package:aiqure/views/LoginScreen/login_screen.dart';
// import 'package:aiqure/views/MbDashboard/HomeScreen/home_screen.dart';
// import 'package:aiqure/views/MemberListScreen/member_list_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:page_transition/page_transition.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     checkUserSession();
//   }
//
//   void checkUserSession() async {
//     UserModel? user = await ApiService.getUserSession();
//
//     Future.delayed(Duration(seconds: 2), () {
//       if (mounted) {
//         if (user != null) {
//           // Navigate to dashboard based on role
//           navigateToDashboard(user);
//         } else {
//           // Show login screen if no session found
//           Navigator.pushReplacement(
//             context,
//             PageTransition(
//               type: PageTransitionType.fade,
//               duration: Duration(milliseconds: 1000),
//               child: LoginScreen(),
//             ),
//           );
//         }
//       }
//     });
//   }
//
//   void navigateToDashboard(UserModel user) {
//     Widget destination = (user.roleType?.toLowerCase() == "member")
//         ? HomeScreen()
//         : MemberListScreen();
//
//     Navigator.pushReplacement(
//       context,
//       PageTransition(
//         type: PageTransitionType.fade,
//         duration: Duration(milliseconds: 1000),
//         child: destination,
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text.rich(
//               TextSpan(
//                 children: [
//                   TextSpan(
//                     text: "Welcome To ",
//                     style: TextStyle(
//                       fontSize: 30.sp,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   TextSpan(
//                     text: "AQure",
//                     style: TextStyle(
//                       fontSize: 30.sp,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF3661E2),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20.h),
//             Image.asset(
//               'assets/doctor.png',
//               width: 350.w,
//               height: 350.h,
//               fit: BoxFit.contain,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:aiqure/models/UserModel/user_model.dart';
import 'package:aiqure/services/api_service.dart';
import 'package:aiqure/views/LoginScreen/login_screen.dart';
import 'package:aiqure/views/MbDashboard/HomeScreen/home_screen.dart';
import 'package:aiqure/views/MemberListScreen/member_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

import '../PermissionsScreen/permissions_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkUserSession();
  }

  void checkUserSession() async {
    UserModel? user = await ApiService.getUserSession();

    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        if (user != null) {
          // Navigate to permission handler then dashboard based on role
          final destination = (user.roleType?.toLowerCase() == "member")
              ? HomeScreen()
              : MemberListScreen();

          Navigator.pushReplacement(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              duration: Duration(milliseconds: 1000),
              child: PermissionHandlerScreen(nextScreen: destination),
            ),
          );
        } else {
          // Show permission handler then login screen if no session found
          Navigator.pushReplacement(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              duration: Duration(milliseconds: 1000),
              child: PermissionHandlerScreen(nextScreen: LoginScreen()),
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Welcome To ",
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: "AQure",
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3661E2),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Image.asset(
              'assets/doctor.png',
              width: 350.w,
              height: 350.h,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}