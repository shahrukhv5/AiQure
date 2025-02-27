// import 'package:aiqure/HomeScreen/welcomeScreen.dart';
// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:lottie/lottie.dart';
// import 'package:page_transition/page_transition.dart';
//
// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSplashScreen(
//       splash: Center(
//         child: Lottie.asset("assets/animation/Animation - 1740652614744.json"),
//       ),
//       nextScreen: Home(),
//       duration: 3000,
//       splashIconSize: 300.sp,
//       splashTransition: SplashTransition.fadeTransition,
//       pageTransitionType: PageTransitionType.topToBottom,
//       // animationDuration: Duration(seconds: 200),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import '../WelcomeScreen/welcomeScreen.dart';

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
          child: WelcomeScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          "assets/animation/Animation - 1740652614744.json",
          width: 200.w,
          height: 200.h,
        ),
      ),
    );
  }
}
