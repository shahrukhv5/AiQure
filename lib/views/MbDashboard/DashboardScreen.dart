// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// //
// // class PathologyDashboard extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         elevation: 0,
// //         title: Row(
// //           children: [
// //             Text(
// //               "AQure",
// //               style: TextStyle(
// //                 fontSize: 18.sp,
// //                 fontWeight: FontWeight.bold,
// //                 color: Colors.black,
// //               ),
// //             ),
// //             Spacer(),
// //             Icon(Icons.notifications, color: Colors.black),
// //             SizedBox(width: 15.w),
// //             Icon(Icons.shopping_cart, color: Colors.black),
// //           ],
// //         ),
// //       ),
// //       body: SingleChildScrollView(
// //         child: Padding(
// //           padding: EdgeInsets.all(16.0.w),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               // Search Bar
// //               TextField(
// //                 decoration: InputDecoration(
// //                   hintText: "Search tests, health packages...",
// //                   prefixIcon: Icon(Icons.search),
// //                   border: OutlineInputBorder(
// //                     borderRadius: BorderRadius.circular(12.r),
// //                   ),
// //                 ),
// //               ),
// //
// //               SizedBox(height: 30.h), // Added extra space
// //
// //               // Categories Section
// //               Text(
// //                 "Test Categories",
// //                 style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
// //               ),
// //               SizedBox(height: 15.h), // Increased space
// //               _buildCategorySection(),
// //
// //               SizedBox(height: 30.h), // Added extra space
// //
// //               // Featured Health Packages
// //               Text(
// //                 "Special Health Packages",
// //                 style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
// //               ),
// //               SizedBox(height: 15.h), // Increased space
// //               _buildFeaturedPackages(),
// //
// //               SizedBox(height: 30.h), // Added extra space
// //
// //               // Popular Tests
// //               Text(
// //                 "Popular Tests",
// //                 style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
// //               ),
// //               SizedBox(height: 15.h), // Increased space
// //               _buildPopularTests(),
// //             ],
// //           ),
// //         ),
// //       ),
// //
// //       // Bottom Navigation
// //       bottomNavigationBar: _buildBottomNav(),
// //     );
// //   }
// //
// //   Widget _buildCategorySection() {
// //     List<Map<String, String>> categories = [
// //       {"name": "Blood Test", "icon": "🩸"},
// //       {"name": "Urine Test", "icon": "💧"},
// //       {"name": "X-ray", "icon": "🦴"},
// //       {"name": "MRI", "icon": "🧠"},
// //       {"name": "ECG", "icon": "💓"},
// //       {"name": "Full Body Checkup", "icon": "🩺"},
// //     ];
// //
// //     return SingleChildScrollView(
// //       scrollDirection: Axis.horizontal,
// //       child: Row(
// //         children: categories.map((category) {
// //           return Padding(
// //             padding: EdgeInsets.only(right: 12.w),
// //             child: Column(
// //               children: [
// //                 CircleAvatar(
// //                   radius: 35.r,
// //                   backgroundColor: Colors.blueAccent.withOpacity(0.1),
// //                   child: Text(
// //                     category["icon"]!,
// //                     style: TextStyle(fontSize: 26.sp),
// //                   ),
// //                 ),
// //                 SizedBox(height: 5.h),
// //                 Text(category["name"]!, style: TextStyle(fontSize: 14.sp)),
// //               ],
// //             ),
// //           );
// //         }).toList(),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildFeaturedPackages() {
// //     return Container(
// //       height: 160.h,
// //       child: ListView(
// //         scrollDirection: Axis.horizontal,
// //         children: [
// //           _packageCard(
// //             "Full Body Checkup",
// //             "Get 30% Off",
// //             "assets/FBC.jpg",
// //           ),
// //           _packageCard(
// //             "Diabetes Screening",
// //             "Save ₹500",
// //             "assets/DSS.webp",
// //           ),
// //           _packageCard(
// //             "Heart Health Package",
// //             "Discount Available",
// //             "assets/HHP.png",
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget _packageCard(String title, String offer, String imagePath) {
// //     return Container(
// //       width: 250.w,
// //       margin: EdgeInsets.only(right: 12.w),
// //       decoration: BoxDecoration(
// //         borderRadius: BorderRadius.circular(12.r),
// //         image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
// //       ),
// //       child: Container(
// //         padding: EdgeInsets.all(12.w),
// //         decoration: BoxDecoration(
// //           borderRadius: BorderRadius.circular(12.r),
// //           color: Colors.black.withOpacity(0.4),
// //         ),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           mainAxisAlignment: MainAxisAlignment.end,
// //           children: [
// //             Text(
// //               title,
// //               style: TextStyle(
// //                 fontSize: 16.sp,
// //                 fontWeight: FontWeight.bold,
// //                 color: Colors.white,
// //               ),
// //             ),
// //             SizedBox(height: 5.h),
// //             Text(
// //               offer,
// //               style: TextStyle(fontSize: 14.sp, color: Colors.yellowAccent),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildPopularTests() {
// //     List<Map<String, String>> tests = [
// //       {"name": "COVID-19 Test", "price": "₹999"},
// //       {"name": "Thyroid Checkup", "price": "₹699"},
// //       {"name": "Liver Function Test", "price": "₹499"},
// //       {"name": "Complete Blood Count", "price": "₹399"},
// //     ];
// //
// //     return Column(
// //       children: tests.map((test) {
// //         return Card(
// //           elevation: 2,
// //           margin: EdgeInsets.symmetric(vertical: 10.h), // Increased spacing
// //           child: ListTile(
// //             leading: Icon(Icons.medical_services, color: Colors.blueAccent),
// //             title: Text(test["name"]!),
// //             subtitle: Text("Results in 24 hours"),
// //             trailing: Text(
// //               test["price"]!,
// //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
// //             ),
// //           ),
// //         );
// //       }).toList(),
// //     );
// //   }
// //
// //   Widget _buildBottomNav() {
// //     return BottomNavigationBar(
// //       selectedItemColor: Colors.blueAccent,
// //       unselectedItemColor: Colors.grey,
// //       items: [
// //         BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
// //         BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
// //         BottomNavigationBarItem(
// //           icon: Icon(Icons.receipt_long),
// //           label: "Orders",
// //         ),
// //         BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
// //       ],
// //     );
// //   }
// // }
// // ----------------------------------------------------------------------
// // import 'package:aiqure/views/MbDashboard/ProfilePage/profile_page.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_screenutil/flutter_screenutil.dart';
// //
// // class HomeScreen extends StatefulWidget {
// //   @override
// //   _HomeScreenState createState() => _HomeScreenState();
// // }
// //
// // class _HomeScreenState extends State<HomeScreen> {
// //   int _selectedIndex = 0;
// //
// //   static final List<Widget> _pages = <Widget>[
// //     HomePage(),
// //     HealthPlansPage(),
// //     LabTestsPage(),
// //     ProfilePage(),
// //   ];
// //
// //   void _onItemTapped(int index) {
// //     setState(() {
// //       _selectedIndex = index;
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar:
// //           _selectedIndex !=
// //                   3 // Hide search bar on Profile page
// //               ? AppBar(
// //                 title: Row(
// //                   children: [
// //                     // Location Section
// //                     GestureDetector(
// //                       onTap: () {
// //                         // Add functionality to open a location picker
// //                         print('Open location picker');
// //                       },
// //                       child: Row(
// //                         children: [
// //                           Icon(Icons.location_on, color: Colors.white),
// //                           SizedBox(width: 8),
// //                           Text(
// //                             'Your Location',
// //                             style: TextStyle(
// //                               color: Colors.white,
// //                               fontWeight: FontWeight.bold,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                     SizedBox(width: 16),
// //
// //                     // Vertical Divider
// //                     Container(
// //                       height: 24,
// //                       width: 1,
// //                       color: Colors.white.withOpacity(0.5),
// //                       margin: EdgeInsets.symmetric(horizontal: 8),
// //                     ),
// //
// //                     SizedBox(width: 16),
// //
// //                     // Search Bar
// //                     Expanded(
// //                       child: Container(
// //                         height: 40.h,
// //                         margin: EdgeInsets.symmetric(horizontal: 8.w),
// //                         decoration: BoxDecoration(
// //                           color: Colors.white, // Solid white background
// //                           borderRadius: BorderRadius.circular(
// //                             25.r,
// //                           ), // Rounded corners
// //                           boxShadow: [
// //                             BoxShadow(
// //                               color: Colors.black.withOpacity(
// //                                 0.1,
// //                               ), // Subtle shadow
// //                               blurRadius: 8,
// //                               offset: Offset(0, 2),
// //                             ),
// //                           ],
// //                         ),
// //                         child: TextField(
// //                           decoration: InputDecoration(
// //                             hintText: 'Search...',
// //                             hintStyle: TextStyle(color: Colors.grey),
// //                             border: InputBorder.none,
// //                             contentPadding: EdgeInsets.symmetric(
// //                               horizontal: 16.w,
// //                               vertical: 12.h,
// //                             ),
// //                             prefixIcon: Icon(
// //                               Icons.search,
// //                               color: Colors.grey,
// //                             ), // Search icon
// //                             suffixIcon: IconButton(
// //                               icon: Icon(
// //                                 Icons.mic,
// //                                 color: Colors.grey,
// //                               ), // Microphone icon
// //                               onPressed: () {
// //                                 // Add functionality for voice search
// //                                 print('Voice search');
// //                               },
// //                             ),
// //                           ),
// //                           style: TextStyle(color: Colors.black), // Text color
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               )
// //               : AppBar(title: Text('Profile')),
// //       body: _pages[_selectedIndex],
// //       // bottomNavigationBar: Container(
// //       //   decoration: BoxDecoration(
// //       //     color: Color(0xFF3661E2), // Background color for the bottom navbar
// //       //     boxShadow: [
// //       //       BoxShadow(
// //       //         color: Colors.black.withOpacity(0.1),
// //       //         blurRadius: 10,
// //       //         offset: Offset(0, -2),
// //       //       ),
// //       //     ],
// //       //   ),
// //       //   child: BottomAppBar(
// //       //     shape: CircularNotchedRectangle(),
// //       //     notchMargin: 6.0,
// //       //     child: Row(
// //       //       mainAxisAlignment: MainAxisAlignment.spaceAround,
// //       //       children: <Widget>[
// //       //         IconButton(
// //       //           icon: Icon(
// //       //             Icons.home,
// //       //             color: _selectedIndex == 0 ? Colors.black : Colors.grey,
// //       //           ),
// //       //           onPressed: () => _onItemTapped(0),
// //       //         ),
// //       //         IconButton(
// //       //           icon: Icon(
// //       //             Icons.health_and_safety,
// //       //             color: _selectedIndex == 1 ? Colors.black : Colors.grey,
// //       //           ),
// //       //           onPressed: () => _onItemTapped(1),
// //       //         ),
// //       //         SizedBox(width: 40), // Space for the center button
// //       //         IconButton(
// //       //           icon: Icon(
// //       //             Icons.medical_services,
// //       //             color: _selectedIndex == 2 ? Colors.black : Colors.grey,
// //       //           ),
// //       //           onPressed: () => _onItemTapped(2),
// //       //         ),
// //       //         IconButton(
// //       //           icon: Icon(
// //       //             Icons.person,
// //       //             color: _selectedIndex == 3 ? Colors.black : Colors.grey,
// //       //           ),
// //       //           onPressed: () => _onItemTapped(3),
// //       //         ),
// //       //       ],
// //       //     ),
// //       //   ),
// //       // ),
// //       bottomNavigationBar: Container(
// //         height: 90.h, // Decrease the height of the bottom navbar
// //         decoration: BoxDecoration(
// //           color: Color(0xFF3661E2), // Background color for the bottom navbar
// //           boxShadow: [
// //             BoxShadow(
// //               color: Colors.black.withOpacity(0.1),
// //               blurRadius: 10.r,
// //               offset: Offset(0, -2),
// //             ),
// //           ],
// //         ),
// //         child: BottomAppBar(
// //           shape: CircularNotchedRectangle(),
// //           notchMargin: 6.0,
// //           child: Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceAround,
// //             children: <Widget>[
// //               IconButton(
// //                 icon: Icon(Icons.home, size: 24.sp, // Adjust icon size
// //                     color: _selectedIndex == 0 ? Colors.black : Colors.grey),
// //                 onPressed: () => _onItemTapped(0),
// //               ),
// //               IconButton(
// //                 icon: Icon(Icons.health_and_safety, size: 24.sp, // Adjust icon size
// //                     color: _selectedIndex == 1 ? Colors.black : Colors.grey),
// //                 onPressed: () => _onItemTapped(1),
// //               ),
// //               SizedBox(width: 40.w), // Space for the center button
// //               IconButton(
// //                 icon: Icon(Icons.medical_services, size: 24.sp, // Adjust icon size
// //                     color: _selectedIndex == 2 ? Colors.black : Colors.grey),
// //                 onPressed: () => _onItemTapped(2),
// //               ),
// //               IconButton(
// //                 icon: Icon(Icons.person, size: 24.sp, // Adjust icon size
// //                     color: _selectedIndex == 3 ? Colors.black : Colors.grey),
// //                 onPressed: () => _onItemTapped(3),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //       // floatingActionButton: FloatingActionButton(
// //       //   onPressed: () {
// //       //     // Add to bag action
// //       //   },
// //       //   child: Icon(Icons.add_shopping_cart),
// //       //   backgroundColor: Color(0xFF3661E2),
// //       // ),
// //       floatingActionButton: Container(
// //         height: 50.h, // Adjust height
// //         width: 50.w, // Adjust width
// //         child: FloatingActionButton(
// //           onPressed: () {
// //             // Add to bag action
// //           },
// //           child: Icon(Icons.add_shopping_cart),
// //           backgroundColor: Color(0xFF3661E2),
// //         ),
// //       ),
// //       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
// //     );
// //   }
// // }
// //
// // // Placeholder pages
// // class HomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Center(child: Text('Home Page'));
// //   }
// // }
// //
// // class HealthPlansPage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Center(child: Text('Health Plans Page'));
// //   }
// // }
// //
// // class LabTestsPage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Center(child: Text('Lab Tests Page'));
// //   }
// // }
// //
// // // class ProfilePage extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Center(child: Text('Profile Page'));
// // //   }
// // // }
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       bottomNavigationBar: Container(
//         padding: EdgeInsets.only(bottom: 10),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(30),
//             topRight: Radius.circular(30),
//           ),
//           boxShadow: [
//             BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2),
//           ],
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(30),
//             topRight: Radius.circular(30),
//           ),
//           child: BottomNavigationBar(
//             type: BottomNavigationBarType.fixed,
//             backgroundColor: Colors.white,
//             selectedItemColor: Colors.blue,
//             unselectedItemColor: Colors.grey,
//             showSelectedLabels: true,
//             showUnselectedLabels: true,
//             items: [
//               BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//               BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Appointments'),
//               BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Messages'),
//               BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//             ],
//           ),
//         ),
//       ),
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(160), // Adjust height
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.blue,
//             borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(30),
//               bottomRight: Radius.circular(30),
//             ),
//           ),
//           child: SafeArea(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Hello 👋',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                           Text(
//                             'Kathryn Murphy',
//                             style: TextStyle(
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                       CircleAvatar(
//                         radius: 24,
//                         // backgroundImage: AssetImage('assets/profile.jpg'),
//                         backgroundColor: Colors.white,
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 15),
//                   // Search Bar inside AppBar
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         prefixIcon: Icon(Icons.search, color: Colors.grey),
//                         hintText: 'Search a doctor, dental issues here...',
//                         border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r),
//                           borderSide: BorderSide.none,),
//                         contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(height: 20),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               child: AppointmentCard(),
//             ),
//             SizedBox(height: 20),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               child: ServicesSection(),
//             ),
//             SizedBox(height: 20),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               child: PopularDoctorsSection(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class AppointmentCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       elevation: 4,
//       child: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ListTile(
//               leading: CircleAvatar(backgroundImage: AssetImage('assets/doctor.jpg')),
//               title: Text('Jacob Jones', style: TextStyle(fontWeight: FontWeight.bold)),
//               subtitle: Text('Dental Surgeon'),
//               trailing: Icon(Icons.add_circle, color: Colors.blue),
//             ),
//             Text('Appointment for tooth filling', style: TextStyle(fontSize: 16)),
//             Text('12th Dec 2023   07:30 AM', style: TextStyle(color: Colors.grey)),
//             SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(shape: StadiumBorder()),
//               child: Text('View Appointment'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ServicesSection extends StatelessWidget {
//   final List<Map<String, dynamic>> services = [
//     {'icon': Icons.medical_services, 'label': 'Implants'},
//     {'icon': Icons.healing, 'label': 'Crown'},
//     {'icon': Icons.brush, 'label': 'Braces'},
//     {'icon': Icons.local_hospital, 'label': 'Tooth Filing'},
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: services.map((service) => Column(
//         children: [
//           Icon(service['icon'], size: 40, color: Colors.blue),
//           Text(service['label']),
//         ],
//       )).toList(),
//     );
//   }
// }
//
// class PopularDoctorsSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Card(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//           elevation: 4,
//           child: ListTile(
//             leading: CircleAvatar(radius: 24, backgroundImage: AssetImage('assets/doctor2.jpg')),
//             title: Text('Dr. Danial Jack', style: TextStyle(fontWeight: FontWeight.bold)),
//             subtitle: Text('MS, BDS, Surgeon'),
//             trailing: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(Icons.star, color: Colors.orange),
//                 Text('4.5 (140 reviews)')
//               ],
//             ),
//           ),
//         ),
//         Card(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//           elevation: 4,
//           child: ListTile(
//             leading: CircleAvatar(radius: 24, backgroundImage: AssetImage('assets/doctor2.jpg')),
//             title: Text('Dr. Danial Jack', style: TextStyle(fontWeight: FontWeight.bold)),
//             subtitle: Text('MS, BDS, Surgeon'),
//             trailing: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(Icons.star, color: Colors.orange),
//                 Text('4.5 (140 reviews)')
//               ],
//             ),
//           ),
//         ),
//         Card(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//           elevation: 4,
//           child: ListTile(
//             leading: CircleAvatar(radius: 24, backgroundImage: AssetImage('assets/doctor2.jpg')),
//             title: Text('Dr. Danial Jack', style: TextStyle(fontWeight: FontWeight.bold)),
//             subtitle: Text('MS, BDS, Surgeon'),
//             trailing: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(Icons.star, color: Colors.orange),
//                 Text('4.5 (140 reviews)')
//               ],
//             ),
//           ),
//         ),
//         Card(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//           elevation: 4,
//           child: ListTile(
//             leading: CircleAvatar(radius: 24, backgroundImage: AssetImage('assets/doctor2.jpg')),
//             title: Text('Dr. Danial Jack', style: TextStyle(fontWeight: FontWeight.bold)),
//             subtitle: Text('MS, BDS, Surgeon'),
//             trailing: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(Icons.star, color: Colors.orange),
//                 Text('4.5 (140 reviews)')
//               ],
//             ),
//           ),
//         ),
//         Card(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//           elevation: 4,
//           child: ListTile(
//             leading: CircleAvatar(radius: 24, backgroundImage: AssetImage('assets/doctor2.jpg')),
//             title: Text('Dr. Danial Jack', style: TextStyle(fontWeight: FontWeight.bold)),
//             subtitle: Text('MS, BDS, Surgeon'),
//             trailing: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(Icons.star, color: Colors.orange),
//                 Text('4.5 (140 reviews)')
//               ],
//             ),
//           ),
//         ),
//         Card(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//           elevation: 4,
//           child: ListTile(
//             leading: CircleAvatar(radius: 24, backgroundImage: AssetImage('assets/doctor2.jpg')),
//             title: Text('Dr. Danial Jack', style: TextStyle(fontWeight: FontWeight.bold)),
//             subtitle: Text('MS, BDS, Surgeon'),
//             trailing: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(Icons.star, color: Colors.orange),
//                 Text('4.5 (140 reviews)')
//               ],
//             ),
//           ),
//         ),
//         Card(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//           elevation: 4,
//           child: ListTile(
//             leading: CircleAvatar(radius: 24, backgroundImage: AssetImage('assets/doctor2.jpg')),
//             title: Text('Dr. Danial Jack', style: TextStyle(fontWeight: FontWeight.bold)),
//             subtitle: Text('MS, BDS, Surgeon'),
//             trailing: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(Icons.star, color: Colors.orange),
//                 Text('4.5 (140 reviews)')
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
//
//
// import 'package:flutter/material.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//
// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   int _currentIndex = 0;
//
//   final List<Widget> _pages = [
//     HomePage(),
//     HealthPlansPage(),
//     LabTestsPage(),
//     ProfilePage(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: _pages[_currentIndex],
//
//       /// Custom Bottom Navigation Bar with Centered Items
//       bottomNavigationBar: Padding(
//         padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
//         child: Container(
//           height: 70, // Adjust height to center items
//           decoration: BoxDecoration(
//             color: Colors.blue,
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Distribute evenly
//             children: [
//               navBarItem(Icons.home, "Home", 0),
//               navBarItem(Icons.health_and_safety, "Health", 1),
//               navBarItem(Icons.biotech, "Lab Tests", 2),
//               navBarItem(Icons.person, "Profile", 3),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   /// Custom Widget for Navigation Items
//   Widget navBarItem(IconData icon, String label, int index) {
//     bool isSelected = _currentIndex == index;
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           _currentIndex = index;
//         });
//       },
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, size: 30, color: isSelected ? Colors.white : Colors.white70),
//           SizedBox(height: 5),
//           Text(
//             label,
//             style: TextStyle(
//               color: isSelected ? Colors.white : Colors.white70,
//               fontSize: 12,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // Sample Pages
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text("🏠 Home Page", style: TextStyle(fontSize: 24)));
//   }
// }
//
// class HealthPlansPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text("📅 Health Plans", style: TextStyle(fontSize: 24)));
//   }
// }
//
// class LabTestsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text("🧪 Lab Tests", style: TextStyle(fontSize: 24)));
//   }
// }
//
// class ProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text("👤 Profile", style: TextStyle(fontSize: 24)));
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.red,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(160), // Adjust height
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.blue,
//             borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(30),
//               bottomRight: Radius.circular(30),
//             ),
//           ),
//           child: SafeArea(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Hello 👋',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                           Text(
//                             'Kathryn Murphy',
//                             style: TextStyle(
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                       CircleAvatar(
//                         radius: 24,
//                         backgroundColor: Colors.white,
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 15),
//                   // Search Bar inside AppBar
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         prefixIcon: Icon(Icons.search, color: Colors.grey),
//                         hintText: 'Search a doctor, dental issues here...',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12.r),
//                           borderSide: BorderSide.none,
//                         ),
//                         contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


// class AppointmentCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       elevation: 4,
//       child: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ListTile(
//               leading: CircleAvatar(backgroundImage: AssetImage('assets/doctor.jpg')),
//               title: Text('Jacob Jones', style: TextStyle(fontWeight: FontWeight.bold)),
//               subtitle: Text('Dental Surgeon'),
//               trailing: Icon(Icons.add_circle, color: Colors.blue),
//             ),
//             Text('Appointment for tooth filling', style: TextStyle(fontSize: 16)),
//             Text('12th Dec 2023   07:30 AM', style: TextStyle(color: Colors.grey)),
//             SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(shape: StadiumBorder()),
//               child: Text('View Appointment'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class PopularDoctorsSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Card(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//           elevation: 4,
//           child: ListTile(
//             leading: CircleAvatar(radius: 24, backgroundImage: AssetImage('assets/doctor2.jpg')),
//             title: Text('Dr. Danial Jack', style: TextStyle(fontWeight: FontWeight.bold)),
//             subtitle: Text('MS, BDS, Surgeon'),
//             trailing: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Icon(Icons.star, color: Colors.orange),
//                 Text('4.5 (140 reviews)')
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:aiqure/models/UserModel/user_model.dart';
import 'package:aiqure/views/MbDashboard/HealthPlansPage/health_plans_page.dart';
import 'package:aiqure/views/MbDashboard/HomePage/home_page.dart';
import 'package:aiqure/views/MbDashboard/LabTestsPage/LabTestsPage.dart';
import 'package:aiqure/views/MbDashboard/ProfilePage/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';
import '../../services/api_service.dart';
import 'CartPage/cart_page.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserModel? user;
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    HealthPlansPage(),
    LabTestsPage(),
    ProfilePage(),
  ];
  @override
  void initState() {
    super.initState();
    fetchUserData();
  }
  void fetchUserData() async {
    UserModel? fetchedUser = await ApiService.getUserSession();
    setState(() {
      user = fetchedUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_currentIndex],

      /// Conditionally Show AppBar (Hide when Profile Page is Selected)
      appBar: _currentIndex == 3
          ? null
          : PreferredSize(
        preferredSize: Size.fromHeight(180),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF3661E2),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// User Greeting + Profile
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello 👋',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          user == null
                              ? CircularProgressIndicator(color: Colors.white)
                              : Text(
                            user!.name!,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          // Shopping Bag Icon
                          IconButton(
                            icon: Stack(
                              children: [
                                Icon(Icons.shopping_bag, color: Colors.white),
                                if (Provider.of<CartProvider>(context, listen: true).items.isNotEmpty)
                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    child: CircleAvatar(
                                      radius: 6,
                                      backgroundColor: Colors.red,
                                      child: Text(
                                        Provider.of<CartProvider>(context, listen: true)
                                            .items
                                            .length
                                            .toString(),
                                        style: TextStyle(color: Colors.white, fontSize: 8),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CartPage()),
                              );
                            },
                          ),
                          SizedBox(width: 10),

                          /// Profile Avatar
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.white,
                            child: Icon(Icons.person, color: Color(0xFF3661E2),),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  /// Location Display
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.white, size: 20),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          "Your location",
                          // _location,
                          style: TextStyle(color: Colors.white, fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),

                  /// Search Bar
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        hintText: 'Search a doctor, dental issues here...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      /// Bottom Navigation Bar
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: 10, left: 20, right: 20),
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: Color(0xFF3661E2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                navBarItem(Icons.home, "Home", 0),
                navBarItem(Icons.health_and_safety, "Health", 1),
                navBarItem(Icons.biotech, "Lab Tests", 2),
                navBarItem(Icons.person, "Profile", 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Custom Navigation Bar Items
  Widget navBarItem(IconData icon, String label, int index) {
    bool isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30, color: isSelected ? Colors.white : Colors.white70),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.white70,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}