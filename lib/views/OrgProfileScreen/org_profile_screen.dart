// import 'package:flutter/material.dart';
// import 'package:aiqure/controllers/AuthController/auth_controller.dart';
// import 'package:aiqure/models/UserModel/user_model.dart';
// import 'package:aiqure/views/LoginScreen/login_screen.dart';
//
// class OrgProfileScreen extends StatefulWidget {
//   @override
//   _OrgProfileScreenState createState() => _OrgProfileScreenState();
// }
//
// class _OrgProfileScreenState extends State<OrgProfileScreen> {
//   UserModel? user;
//   bool isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     fetchUserData();
//   }
//
//   void fetchUserData() async {
//     user = await AuthController.getUserSession();
//     if (mounted) {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
//
//   void logout() async {
//     await AuthController.logout();
//     if (mounted) {
//       Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(builder: (context) => LoginScreen()),
//             (route) => false,
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       appBar: AppBar(
//         title: Text("Profile"),
//         // backgroundColor: Colors.blueAccent,
//         centerTitle: true,
//       ),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : user == null
//           ? Center(child: Text("No user data available"))
//           : Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             // Profile Avatar
//             CircleAvatar(
//               radius: 50,
//               backgroundColor: Color(0xFF3661E2),
//               child: Text(
//                 user!.name?.isNotEmpty == true
//                     ? user!.name![0].toUpperCase()
//                     : "?",
//                 style: TextStyle(fontSize: 40, color: Colors.white),
//               ),
//             ),
//             SizedBox(height: 20),
//
//             // Profile Details Card
//             Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               elevation: 4,
//               child: Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Column(
//                   children: [
//                     ListTile(
//                       leading: Icon(Icons.person, color: Color(0xFF3661E2)),
//                       title: Text(user!.name ?? 'N/A',
//                           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                       subtitle: Text("Organization Name"),
//                     ),
//                     Divider(),
//                     ListTile(
//                       leading: Icon(Icons.email, color: Colors.green),
//                       title: Text(user!.email ?? 'N/A',
//                           style: TextStyle(fontSize: 16)),
//                       subtitle: Text("Email"),
//                     ),
//                     Divider(),
//                     ListTile(
//                       leading: Icon(Icons.phone, color: Colors.orange),
//                       title: Text(user!.contactNo ?? 'N/A',
//                           style: TextStyle(fontSize: 16)),
//                       subtitle: Text("Phone Number"),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 30),
//
//             // Logout Button
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton.icon(
//                 onPressed: logout,
//                 icon: Icon(Icons.logout, color: Colors.white),
//                 label: Text("Logout", style: TextStyle(fontSize: 16, color: Colors.white)),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.red,
//                   padding: EdgeInsets.symmetric(vertical: 14),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   elevation: 4,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:aiqure/services/api_service.dart';
// import 'package:flutter/material.dart';
// import 'package:aiqure/models/UserModel/user_model.dart';
// import 'package:aiqure/views/LoginScreen/login_screen.dart';
//
// class OrgProfileScreen extends StatefulWidget {
//   @override
//   _OrgProfileScreenState createState() => _OrgProfileScreenState();
// }
//
// class _OrgProfileScreenState extends State<OrgProfileScreen> {
//   UserModel? user;
//   bool isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     fetchUserData();
//   }
//
//   void fetchUserData() async {
//     user = await ApiService.getUserSession();
//     if (mounted) {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }
//
//   void logout() async {
//     await ApiService.logout();
//     if (mounted) {
//       Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(builder: (context) => LoginScreen()),
//             (route) => false,
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Profile"),
//         centerTitle: true,
//       ),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : user == null
//           ? Center(child: Text("No user data available"))
//           : Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             // Profile Avatar
//             CircleAvatar(
//               radius: 50,
//               backgroundColor: Color(0xFF3661E2),
//               child: Text(
//                 user!.name?.isNotEmpty == true
//                     ? user!.name![0].toUpperCase()
//                     : "?",
//                 style: TextStyle(fontSize: 40, color: Colors.white),
//               ),
//             ),
//             SizedBox(height: 20),
//
//             // Profile Details Card
//             Card(
//               color: Colors.grey.shade100,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               elevation: 4,
//               child: Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Column(
//                   children: [
//                     ListTile(
//                       leading: Icon(Icons.person, color: Color(0xFF3661E2)),
//                       title: Text(user!.name ?? 'N/A',
//                           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                       subtitle: Text("Organization Name"),
//                     ),
//                     Divider(),
//                     ListTile(
//                       leading: Icon(Icons.email, color: Colors.green),
//                       title: Text(user!.email ?? 'N/A',
//                           style: TextStyle(fontSize: 16)),
//                       subtitle: Text("Email"),
//                     ),
//                     Divider(),
//                     ListTile(
//                       leading: Icon(Icons.phone, color: Colors.orange),
//                       title: Text(user!.contactNo ?? 'N/A',
//                           style: TextStyle(fontSize: 16)),
//                       subtitle: Text("Phone Number"),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: 30),
//
//             // Logout Button
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton.icon(
//                 onPressed: logout,
//                 icon: Icon(Icons.logout, color: Colors.white),
//                 label: Text("Logout", style: TextStyle(fontSize: 16, color: Colors.white)),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.red,
//                   padding: EdgeInsets.symmetric(vertical: 14),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   elevation: 4,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:aiqure/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:aiqure/models/UserModel/user_model.dart';
import 'package:aiqure/views/LoginScreen/login_screen.dart';

class OrgProfileScreen extends StatefulWidget {
  @override
  _OrgProfileScreenState createState() => _OrgProfileScreenState();
}

class _OrgProfileScreenState extends State<OrgProfileScreen> {
  UserModel? user;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  void fetchUserData() async {
    user = await ApiService.getUserSession();
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  void logout() async {
    await ApiService.logout();
    if (mounted) {
      // Use PageRouteBuilder for a custom transition
      Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
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
            (route) => false, // Remove all routes
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : user == null
          ? Center(child: Text("No user data available"))
          : Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Avatar
            CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFF3661E2),
              child: Text(
                user!.name?.isNotEmpty == true
                    ? user!.name![0].toUpperCase()
                    : "?",
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),

            // Profile Details Card
            Card(
              color: Colors.grey.shade100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.person, color: Color(0xFF3661E2)),
                      title: Text(user!.name ?? 'N/A',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      subtitle: Text("Organization Name"),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.email, color: Colors.green),
                      title: Text(user!.email ?? 'N/A',
                          style: TextStyle(fontSize: 16)),
                      subtitle: Text("Email"),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.phone, color: Colors.orange),
                      title: Text(user!.contactNo ?? 'N/A',
                          style: TextStyle(fontSize: 16)),
                      subtitle: Text("Phone Number"),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),

            // Logout Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: logout,
                icon: Icon(Icons.logout, color: Colors.white),
                label: Text("Logout", style: TextStyle(fontSize: 16, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}