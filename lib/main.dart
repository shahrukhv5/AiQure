import 'package:aiqure/providers/cart_provider.dart';
import 'package:aiqure/utils/ThemeData/customTheme.dart';
import 'package:aiqure/views/SplashScreen/splash%20_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'controllers/MemberController/member_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Geolocator.checkPermission();
  // runApp(
  //   ChangeNotifierProvider(
  //     create: (context) => MemberController(),
  //     child: MyApp(),
  //   ),
  // );
  runApp(
    MultiProvider( // Replace ChangeNotifierProvider with MultiProvider
      providers: [
        ChangeNotifierProvider(create: (context) => MemberController()),
        ChangeNotifierProvider(create: (context) => CartProvider()), // Add CartProvider
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 1000),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: customTheme.copyWith(
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: {
                TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
              },
            ),
          ),
          home: const SplashScreen(),
        );
      },
    );
  }
}



// import 'package:aiqure/utils/ThemeData/customTheme.dart';
// import 'package:aiqure/views/SplashScreen/splash%20_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:aiqure/views/members_list_page.dart';
// import 'package:aiqure/views/member_detail_view.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
//
// import 'controllers/MemberController/member_controller.dart'; // Import the MemberDetailView
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => MemberController(),
//       child: MyApp(),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(430, 1000),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (context, child) {
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           theme: customTheme.copyWith(
//             pageTransitionsTheme: const PageTransitionsTheme(
//               builders: {
//                 TargetPlatform.android: CupertinoPageTransitionsBuilder(),
//                 TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
//               },
//             ),
//           ),
//           home: const SplashScreen(),
//           routes: {
//             '/memberList': (context) => MemberListView(), // Define the member list route
//             '/memberDetail': (context) {
//               // Extract the arguments
//               final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
//               return MemberDetailView(id: args['id']);
//             },
//           },
//         );
//       },
//     );
//   }
// }