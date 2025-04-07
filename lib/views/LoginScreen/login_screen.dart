// import 'package:aiqure/views/MbDashboard/DashboardScreen.dart';
// import 'package:aiqure/views/MemberListScreen/member_list_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import '../../controllers/AuthController/auth_controller.dart';
// import '../../models/UserModel/user_model.dart';
//
// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController contactController = TextEditingController();
//   bool isLoading = false; // Loading indicator
//
//   void verifyUser() async {
//     String contactNo = contactController.text.trim();
//
//     if (contactNo.isEmpty) {
//       showToast("Please enter a valid contact number or email");
//       return;
//     }
//
//     setState(() {
//       isLoading = true;
//     });
//
//     try {
//       bool isEmail = contactNo.contains("@");
//
//       UserModel? user = await AuthController.verifyUser(
//         contactNo: isEmail ? null : contactNo,
//         email: isEmail ? contactNo : null,
//       );
//
//       setState(() {
//         isLoading = false;
//       });
//
//       if (user != null) {
//         await AuthController.saveUserSession(user); // Save user session
//         navigateToDashboard(user);
//       } else {
//         showToast("Invalid credentials. Check your input.");
//       }
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       showToast("An error occurred. Please try again.");
//     }
//   }
//
//   void navigateToDashboard(UserModel user) {
//     Future.microtask(() {
//       Widget destination = (user.roleType?.toLowerCase() == "member")
//           ? PathologyDashboard()
//           : MemberListScreen();
//
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => destination),
//       );
//     });
//   }
//
//   void showToast(String message) {
//     Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       backgroundColor: Colors.black,
//       textColor: Colors.white,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Center(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.all(20.w),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "User Verification",
//                       style: TextStyle(
//                         fontSize: 35.sp,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xFF3661E2),
//                       ),
//                     ),
//                     SizedBox(height: 30.h),
//
//                     Image.asset(
//                       'assets/login.png',
//                       width: 350.w,
//                       height: 350.h,
//                       fit: BoxFit.contain,
//                     ),
//                     SizedBox(height: 20.h),
//
//                     TextFormField(
//                       controller: contactController,
//                       decoration: InputDecoration(
//                         labelText: "Enter Email or Phone",
//                         prefixIcon: Icon(Icons.person),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12.r),
//                         ),
//                         filled: true,
//                       ),
//                       keyboardType: TextInputType.text,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "Please enter your email or phone";
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 24.h),
//
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: isLoading ? null : verifyUser,
//                         style: ElevatedButton.styleFrom(
//                           padding: EdgeInsets.symmetric(vertical: 14.h),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12.r),
//                           ),
//                           elevation: 4,
//                         ),
//                         child: isLoading
//                             ? CircularProgressIndicator(
//                           color: Colors.white,
//                         )
//                             : Text(
//                           "Verify",
//                           style: TextStyle(
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:aiqure/services/api_service.dart';
// import 'package:aiqure/views/MbDashboard/DashboardScreen.dart';
// import 'package:aiqure/views/MemberListScreen/member_list_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import '../../models/UserModel/user_model.dart';
//
// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController contactController = TextEditingController();
//   bool isLoading = false; // Loading indicator
//
//   void verifyUser() async {
//     String contactNo = contactController.text.trim();
//
//     if (contactNo.isEmpty) {
//       showToast("Please enter a valid contact number or email");
//       return;
//     }
//
//     setState(() {
//       isLoading = true;
//     });
//
//     try {
//       bool isEmail = contactNo.contains("@");
//
//       UserModel? user = await ApiService.verifyUser(
//         contactNo: isEmail ? null : contactNo,
//         email: isEmail ? contactNo : null,
//       );
//
//       setState(() {
//         isLoading = false;
//       });
//
//       if (user != null) {
//         await ApiService.saveUserSession(user); // Save user session
//         navigateToDashboard(user);
//       } else {
//         showToast("Invalid credentials. Check your input.");
//       }
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       showToast("An error occurred. Please try again.");
//     }
//   }
//
//   void navigateToDashboard(UserModel user) {
//     Future.microtask(() {
//       Widget destination = (user.roleType?.toLowerCase() == "member")
//           ? PathologyDashboard()
//           : MemberListScreen();
//
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => destination),
//       );
//     });
//   }
//
//   void showToast(String message) {
//     Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       backgroundColor: Colors.black,
//       textColor: Colors.white,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Center(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.all(20.w),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "User Verification",
//                       style: TextStyle(
//                         fontSize: 35.sp,
//                         fontWeight: FontWeight.bold,
//                         color: Color(0xFF3661E2),
//                       ),
//                     ),
//                     SizedBox(height: 30.h),
//
//                     Image.asset(
//                       'assets/login.png',
//                       width: 350.w,
//                       height: 350.h,
//                       fit: BoxFit.contain,
//                     ),
//                     SizedBox(height: 20.h),
//
//                     TextFormField(
//                       controller: contactController,
//                       decoration: InputDecoration(
//                         labelText: "Enter Email or Phone",
//                         prefixIcon: Icon(Icons.person),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12.r),
//                         ),
//                         filled: true,
//                       ),
//                       keyboardType: TextInputType.text,
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "Please enter your email or phone";
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(height: 24.h),
//
//                     SizedBox(
//                       width: double.infinity,
//                       child: ElevatedButton(
//                         onPressed: isLoading ? null : verifyUser,
//                         style: ElevatedButton.styleFrom(
//                           padding: EdgeInsets.symmetric(vertical: 14.h),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12.r),
//                           ),
//                           elevation: 4,
//                         ),
//                         child: isLoading
//                             ? CircularProgressIndicator(
//                           color: Colors.white,
//                         )
//                             : Text(
//                           "Verify",
//                           style: TextStyle(
//                             fontSize: 16.sp,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:aiqure/services/api_service.dart';
import 'package:aiqure/views/MbDashboard/HomeScreen/home_screen.dart';
// import 'package:aiqure/views/MbDashboard/DashboardScreen.dart';
import 'package:aiqure/views/MemberListScreen/member_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../models/UserModel/user_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController contactController = TextEditingController();
  bool isLoading = false; // Loading indicator

  void verifyUser() async {
    String contactNo = contactController.text.trim();

    if (contactNo.isEmpty) {
      showToast("Please enter a valid contact number or email");
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      bool isEmail = contactNo.contains("@");

      UserModel? user = await ApiService.verifyUser(
        contactNo: isEmail ? null : contactNo,
        email: isEmail ? contactNo : null,
      );

      setState(() {
        isLoading = false;
      });

      if (user != null) {
        await ApiService.saveUserSession(user); // Save user session
        navigateToDashboard(user);
      } else {
        showToast("Invalid credentials. Check your input.");
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      showToast("An error occurred. Please try again.");
    }
  }

  void navigateToDashboard(UserModel user) {
    Future.microtask(() {
      Widget destination = (user.roleType?.toLowerCase() == "member")
          ? HomeScreen()
          : MemberListScreen();

      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => destination,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Define the transition animation
            const begin = Offset(1.0, 0.0); // Slide from right to left
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
          transitionDuration: Duration(milliseconds: 500), // Transition duration
        ),
      );
    });
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "User Verification",
                      style: TextStyle(
                        fontSize: 35.sp,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3661E2),
                      ),
                    ),
                    SizedBox(height: 30.h),

                    Image.asset(
                      'assets/login.png',
                      width: 350.w,
                      height: 350.h,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 20.h),

                    TextFormField(
                      controller: contactController,
                      decoration: InputDecoration(
                        labelText: "Enter Email or Phone",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        filled: true,
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter your email or phone";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.h),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : verifyUser,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          elevation: 4,
                        ),
                        child: isLoading
                            ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                            : Text(
                          "Verify",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}