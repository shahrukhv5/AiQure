import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../OrgLoginScreen/org_login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: const Color(0xFFEFF6FF),
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
              SizedBox(height: 30.h), // Spacing
              // Organization Login Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrgLoginScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      // backgroundColor: Colors.blue,
                      // foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 12.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: const Text("Organization"),
                  ),
                  // SizedBox(width: 15.w), // Spacing
                  // Member Login Button
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      // backgroundColor: Colors.blue,
                      // foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: 30.w,
                        vertical: 12.h,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: const Text("Member"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
