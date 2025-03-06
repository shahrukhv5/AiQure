import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import '../OrgLoginScreen/org_login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.fade, // Change transition type here
          alignment: Alignment.center, // Scale transition starts from center
          duration: Duration(milliseconds: 1000), // Adjust duration if needed
          child: OrgLoginScreen(),
        ),
      );
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
                      // color: Colors.black,
                    ),
                  ),
                  TextSpan(
                    text: "AiQure",
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
