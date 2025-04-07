// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../models/Member/member.dart';
//
// class RequestScreen extends StatefulWidget {
//   final Function(Member) onAccept;
//
//   RequestScreen({required this.onAccept});
//
//   @override
//   _RequestScreenState createState() => _RequestScreenState();
// }
//
// class _RequestScreenState extends State<RequestScreen> {
//   List<Member> requestList = [
//     Member(
//       name: "John Doe",
//       contact: "+1234567890",
//       email: "john.doe@example.com",
//       gender: "Male",
//       age: "28",
//       address: "123 Main Street, New York",
//     ),
//     Member(
//       name: "Jane Smith",
//       contact: "+9876543210",
//       email: "jane.smith@example.com",
//       gender: "Female",
//       age: "25",
//       address: "456 Elm Street, California",
//     ),
//     Member(
//       name: "Alice Johnson",
//       contact: "+1122334455",
//       email: "alice.j@example.com",
//       gender: "Female",
//       age: "30",
//       address: "789 Maple Avenue, Texas",
//     ),
//   ];
//
//   void _acceptRequest(Member member) {
//     widget.onAccept(member);
//     setState(() {
//       requestList.remove(member);
//     });
//
//     if (requestList.isEmpty) {
//       Navigator.pop(context, requestList);
//     }
//   }
//
//   void _rejectRequest(Member member) {
//     setState(() {
//       requestList.remove(member);
//     });
//
//     if (requestList.isEmpty) {
//       Navigator.pop(context, requestList);
//     }
//   }
//
//   void _showUserDetails(Member member) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text(member.name, textAlign: TextAlign.center),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _infoRow("Contact", member.contact),
//               _infoRow("Email", member.email),
//               _infoRow("Gender", member.gender),
//               _infoRow("Age", member.age.toString()),
//               _infoRow("Address", member.address),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: Text("Close"),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   Widget _infoRow(String label, String value) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 4.h),
//       child: Row(
//         children: [
//           Text(
//             "$label: ",
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//           Expanded(
//             child: Text(value, style: TextStyle(color: Colors.black87)),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Requests",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 24.sp,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: requestList.isEmpty
//           ? Center(
//         child: Text(
//           "No Pending Requests",
//           style: TextStyle(fontSize: 18.sp, color: Colors.grey),
//         ),
//       )
//           : ListView.builder(
//         padding: EdgeInsets.all(16.w),
//         itemCount: requestList.length,
//         itemBuilder: (context, index) {
//           final member = requestList[index];
//
//           return Card(
//             elevation: 4,
//             margin: EdgeInsets.symmetric(vertical: 8.h),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12.r),
//             ),
//             child: InkWell(
//               borderRadius: BorderRadius.circular(12.r),
//               onTap: () => _showUserDetails(member),
//               child: Padding(
//                 padding: EdgeInsets.all(12.w),
//                 child: Row(
//                   children: [
//                     CircleAvatar(
//                       backgroundColor: Colors.blueAccent,
//                       radius: 24.r,
//                       child: Text(
//                         member.name[0].toUpperCase(),
//                         style: TextStyle(
//                           fontSize: 20.sp,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 16.w),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             member.name,
//                             style: TextStyle(
//                               fontSize: 16.sp,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black87,
//                             ),
//                           ),
//                           SizedBox(height: 4.h),
//                           Text(
//                             "Contact: ${member.contact}",
//                             style: TextStyle(
//                               fontSize: 14.sp,
//                               color: Colors.grey.shade600,
//                             ),
//                           ),
//                           Text(
//                             "Email: ${member.email}",
//                             style: TextStyle(
//                               fontSize: 14.sp,
//                               color: Colors.grey.shade600,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         IconButton(
//                           icon: Icon(Icons.check_circle, color: Colors.green),
//                           onPressed: () => _acceptRequest(member),
//                         ),
//                         IconButton(
//                           icon: Icon(Icons.cancel, color: Colors.red),
//                           onPressed: () => _rejectRequest(member),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
