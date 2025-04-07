import 'dart:convert';
import 'package:aiqure/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts
import '../../models/Member/member.dart';
import '../AddMemberScreen/add_member_screen.dart';
import '../EditMemberScreen/edit_member_screen.dart';
import '../OrgProfileScreen/org_profile_screen.dart';

class MemberListScreen extends StatefulWidget {
  const MemberListScreen({super.key});

  @override
  State<MemberListScreen> createState() => _MemberListScreenState();
}

class _MemberListScreenState extends State<MemberListScreen> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  List<Member> _members = [];
  List<Member> filteredMembers = [];
  final TextEditingController _searchController = TextEditingController();
  bool isLoading = true;
  int notificationCount = 3;

  @override
  void initState() {
    super.initState();
    _loadMembers();
    _searchController.addListener(_filterMembers);
  }

  Future<void> _loadMembers() async {
    if (!mounted) return;

    setState(() {
      isLoading = true; // Show loading indicator
    });

    try {
      final response = await ApiService.listMembers();
      print("Load Members Response: ${response.statusCode}");
      print("Load Members Body: ${response.body}");

      if (mounted) {
        if (response.statusCode == 200) {
          final responseBody = jsonDecode(response.body);
          if (responseBody is Map && responseBody.containsKey('body')) {
            final body = responseBody['body'];
            if (body is Map && body.containsKey('data')) {
              final data = body['data'];
              if (data is List) {
                setState(() {
                  _members =
                      data.map((item) {
                        return Member.fromJson(item);
                      }).toList();

                  filteredMembers = List.from(_members);
                  isLoading = false; // Hide loading indicator
                  print("UI Updated with ${_members.length} members");
                });
              }
            }
          }
        } else {
          print("❌ Failed to load members: ${response.statusCode}");
          setState(() {
            isLoading = false; // Hide loading indicator
          });
        }
      }
    } catch (error) {
      print("❌ Error loading members: $error");
      if (mounted) {
        setState(() {
          isLoading = false; // Hide loading indicator
        });
      }
    }
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterMembers);
    _searchController.dispose();
    super.dispose();
  }

  void _filterMembers() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredMembers =
          query.isEmpty
              ? List.from(_members)
              : _members.where((member) {
                return member.name?.toLowerCase().contains(query) == true ||
                    member.contactNo?.toLowerCase().contains(query) == true ||
                    member.email?.toLowerCase().contains(query) == true;
              }).toList();
    });
  }

  void _showMemberDetailsPopup(Member member) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Member Details",
                  style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(thickness: 1.5),
                _buildDetailRow("Name", member.name ?? "N/A"),
                _buildDetailRow("Contact No", member.contactNo ?? "N/A"),
                _buildDetailRow("Email", member.email ?? "N/A"),
                _buildDetailRow("Date of Birth", member.dob ?? "N/A"),
                _buildDetailRow("Address", member.address ?? "N/A"),
                _buildDetailRow("Age", member.age?.toString() ?? "N/A"),
                _buildDetailRow("Gender", member.gender?.toString() ?? "N/A"),
                _buildDetailRow(
                  "Wallet Price",
                  member.walletPrice != null
                      ? "\$${member.walletPrice!.toStringAsFixed(2)}"
                      : "N/A",
                ),
                SizedBox(height: 10.h),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Close"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        children: [
          Text(
            "$title: ",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.poppins(fontSize: 16.sp),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMemberCard(Member member) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      elevation: 3,
      color: Colors.grey.shade100,
      shadowColor: Colors.black26,
      child: ListTile(
        contentPadding: EdgeInsets.all(16.w),
        title: Text(
          member.name ?? "N/A",
          style: GoogleFonts.poppins(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Contact: ${member.contactNo ?? "N/A"}",
              style: GoogleFonts.poppins(fontSize: 16.sp),
            ),
            Text(
              "Email: ${member.email ?? "N/A"}",
              style: GoogleFonts.poppins(fontSize: 16.sp),
            ),
          ],
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'edit') {
              // Navigate to EditMemberScreen with a smooth transition
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder:
                      (context, animation, secondaryAnimation) =>
                          EditMemberScreen(member: member),
                  transitionsBuilder: (
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ) {
                    const begin = Offset(1.0, 0.0); // Slide from right to left
                    const end = Offset.zero;
                    const curve = Curves.easeInOut;

                    var tween = Tween(
                      begin: begin,
                      end: end,
                    ).chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);

                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                  transitionDuration: Duration(milliseconds: 500),
                ),
              ).then((_) => _loadMembers()); // Refresh the list after editing
            } else if (value == 'delete') {
              _confirmDelete(member);
            }
          },
          itemBuilder:
              (context) => [
                PopupMenuItem(value: 'edit', child: Text('Edit')),
                PopupMenuItem(
                  value: 'delete',
                  child: Text('Delete', style: TextStyle(color: Colors.red)),
                ),
              ],
        ),
      ),
    );
  }

  void _confirmDelete(Member member) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Confirm Delete"),
          content: Text(
            "Are you sure you want to delete ${member.name ?? "this member"}?",
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                Navigator.pop(context); // Close the confirmation dialog
                setState(() {
                  isLoading = true; // Show loading indicator
                });

                final response = await ApiService.deleteMember(member.id!);
                if (mounted) {
                  if (response.statusCode == 200) {
                    _scaffoldMessengerKey.currentState?.showSnackBar(
                      SnackBar(content: Text("Member deleted successfully")),
                    );
                    _loadMembers(); // Refresh the list after deletion
                  } else {
                    _scaffoldMessengerKey.currentState?.showSnackBar(
                      SnackBar(content: Text("Failed to delete member")),
                    );
                  }
                }

                if (mounted) {
                  setState(() {
                    isLoading = false; // Hide loading indicator
                  });
                }
              },
              child: Text("Delete", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldMessengerKey,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF3661E2), Color(0xFF6A88E7)],
          ),
        ),
        child: Column(
          children: [
            AppBar(
              title: Text(
                "Dashboard",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.sp,
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              actions: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: Icon(Icons.person, color: Color(0xFF3661E2)),
                    onPressed: () {
                      // Navigate to OrgProfileScreen with a smooth transition
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  OrgProfileScreen(),
                          transitionsBuilder: (
                            context,
                            animation,
                            secondaryAnimation,
                            child,
                          ) {
                            const begin = Offset(
                              1.0,
                              0.0,
                            ); // Slide from right to left
                            const end = Offset.zero;
                            const curve = Curves.easeInOut;

                            var tween = Tween(
                              begin: begin,
                              end: end,
                            ).chain(CurveTween(curve: curve));
                            var offsetAnimation = animation.drive(tween);

                            return SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            );
                          },
                          transitionDuration: Duration(milliseconds: 500),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: Stack(
                    children: [
                      IconButton(
                        icon: Icon(Icons.notifications),
                        onPressed: () {},
                      ),
                      if (notificationCount > 0)
                        Positioned(
                          right: 6,
                          top: 6,
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.red,
                            child: Text(
                              '$notificationCount',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.r),
                    topRight: Radius.circular(25.r),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.w),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.r),
                                color: Colors.grey.shade100,
                              ),
                              child: TextField(
                                controller: _searchController,
                                decoration: InputDecoration(
                                  hintText: "Search members...",
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.grey.shade600,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey.shade100,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          ElevatedButton.icon(
                            onPressed: () {
                              // Navigate to AddMemberScreen with a smooth transition
                              Navigator.pushReplacement(
                                context,
                                PageRouteBuilder(
                                  pageBuilder:
                                      (
                                        context,
                                        animation,
                                        secondaryAnimation,
                                      ) => AddMemberScreen(
                                        onMemberAdded: _loadMembers,
                                      ),
                                  transitionsBuilder: (
                                    context,
                                    animation,
                                    secondaryAnimation,
                                    child,
                                  ) {
                                    const begin = Offset(
                                      1.0,
                                      0.0,
                                    ); // Slide from right to left
                                    const end = Offset.zero;
                                    const curve = Curves.easeInOut;

                                    var tween = Tween(
                                      begin: begin,
                                      end: end,
                                    ).chain(CurveTween(curve: curve));
                                    var offsetAnimation = animation.drive(
                                      tween,
                                    );

                                    return SlideTransition(
                                      position: offsetAnimation,
                                      child: child,
                                    );
                                  },
                                  transitionDuration: Duration(
                                    milliseconds: 500,
                                  ),
                                ),
                              );
                            },
                            icon: Icon(Icons.add),
                            label: Text(
                              "Add",
                              style: TextStyle(color: Colors.black),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.shade100,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child:
                          isLoading
                              ? Center(
                                child: CircularProgressIndicator(
                                  color: Color(0xFF3661E2),
                                ),
                              )
                              : filteredMembers.isEmpty
                              ? Center(
                                child: Text(
                                  "No members found",
                                  style: GoogleFonts.poppins(
                                    fontSize: 18.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              )
                              : ListView.builder(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                itemCount: filteredMembers.length,
                                itemBuilder: (context, index) {
                                  final member = filteredMembers[index];
                                  return GestureDetector(
                                    onTap:
                                        () => _showMemberDetailsPopup(member),
                                    child: _buildMemberCard(member),
                                  );
                                },
                              ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'dart:convert';
// import 'package:aiqure/services/api_service.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../../models/Member/member.dart';
// import '../AddMemberScreen/add_member_screen.dart';
// import '../EditMemberScreen/edit_member_screen.dart';
// import '../OrgProfileScreen/org_profile_screen.dart';
//
// class MemberListScreen extends StatefulWidget {
//   const MemberListScreen({super.key});
//
//   @override
//   State<MemberListScreen> createState() => _MemberListScreenState();
// }
//
// class _MemberListScreenState extends State<MemberListScreen> {
//   final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
//   GlobalKey<ScaffoldMessengerState>();
//   List<Member> _members = [];
//   List<Member> filteredMembers = [];
//   final TextEditingController _searchController = TextEditingController();
//   bool isLoading = true;
//   int notificationCount = 3;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadMembers();
//     _searchController.addListener(_filterMembers);
//   }
//
//   Future<void> _loadMembers() async {
//     if (!mounted) return;
//
//     setState(() => isLoading = true);
//
//     try {
//       final response = await ApiService.listMembers();
//
//       if (mounted) {
//         if (response.statusCode == 200) {
//           final responseBody = jsonDecode(response.body);
//           if (responseBody is Map && responseBody.containsKey('body')) {
//             final body = responseBody['body'];
//             if (body is Map && body.containsKey('data')) {
//               final data = body['data'];
//               if (data is List) {
//                 setState(() {
//                   _members = data.map((item) => Member.fromJson(item)).toList();
//                   filteredMembers = List.from(_members);
//                   isLoading = false;
//                 });
//                 return;
//               }
//             }
//           }
//         }
//         setState(() => isLoading = false);
//         _scaffoldMessengerKey.currentState?.showSnackBar(
//           const SnackBar(content: Text("Failed to load members")),
//         );
//       }
//     } catch (error) {
//       if (mounted) {
//         setState(() => isLoading = false);
//         _scaffoldMessengerKey.currentState?.showSnackBar(
//           SnackBar(content: Text("Error: $error")),
//         );
//       }
//     }
//   }
//
//   @override
//   void dispose() {
//     _searchController.removeListener(_filterMembers);
//     _searchController.dispose();
//     super.dispose();
//   }
//
//   void _filterMembers() {
//     final query = _searchController.text.toLowerCase();
//     setState(() {
//       filteredMembers = _members.where((member) {
//         return member.name?.toLowerCase().contains(query) == true ||
//             member.contactNo?.toLowerCase().contains(query) == true ||
//             member.email?.toLowerCase().contains(query) == true ||
//             member.gender?.toLowerCase().contains(query) == true;
//       }).toList();
//     });
//   }
//
//   void _showMemberDetailsPopup(Member member) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return Dialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15.r),
//           ),
//           child: Padding(
//             padding: EdgeInsets.all(16.w),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   "Member Details",
//                   style: GoogleFonts.poppins(
//                     fontSize: 20.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Divider(thickness: 1.5),
//                 _buildDetailRow("Name", member.name ?? "N/A"),
//                 _buildDetailRow("Gender", member.gender ?? "N/A"), // Added gender
//                 _buildDetailRow("Contact No", member.contactNo ?? "N/A"),
//                 _buildDetailRow("Email", member.email ?? "N/A"),
//                 _buildDetailRow("Date of Birth", member.dob ?? "N/A"),
//                 _buildDetailRow("Address", member.address ?? "N/A"),
//                 _buildDetailRow("Age", member.age?.toString() ?? "N/A"),
//                 _buildDetailRow(
//                   "Wallet Price",
//                   member.walletPrice != null
//                       ? "\$${member.walletPrice!.toStringAsFixed(2)}"
//                       : "N/A",
//                 ),
//                 SizedBox(height: 10.h),
//                 ElevatedButton(
//                   onPressed: () => Navigator.pop(context),
//                   child: Text("Close"),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildDetailRow(String title, String value) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 6.h),
//       child: Row(
//         children: [
//           Text(
//             "$title: ",
//             style: GoogleFonts.poppins(
//               fontWeight: FontWeight.bold,
//               fontSize: 16.sp,
//             ),
//           ),
//           Expanded(
//             child: Text(
//               value,
//               style: GoogleFonts.poppins(fontSize: 16.sp),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildMemberCard(Member member) {
//     return Card(
//       margin: EdgeInsets.symmetric(vertical: 8.h),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
//       elevation: 3,
//       child: ListTile(
//         contentPadding: EdgeInsets.all(16.w),
//         title: Text(
//           member.name ?? "N/A",
//           style: GoogleFonts.poppins(
//             fontSize: 18.sp,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Gender: ${member.gender ?? "N/A"}",
//               style: GoogleFonts.poppins(fontSize: 14.sp),
//             ),
//             Text(
//               "Contact: ${member.contactNo ?? "N/A"}",
//               style: GoogleFonts.poppins(fontSize: 14.sp),
//             ),
//           ],
//         ),
//         trailing: PopupMenuButton<String>(
//           onSelected: (value) => _handleMenuSelection(value, member),
//           itemBuilder: (context) => [
//             const PopupMenuItem(value: 'edit', child: Text('Edit')),
//             const PopupMenuItem(
//               value: 'delete',
//               child: Text('Delete', style: TextStyle(color: Colors.red)),
//             ),
//           ],
//         ),
//         onTap: () => _showMemberDetailsPopup(member),
//       ),
//     );
//   }
//
//   void _handleMenuSelection(String value, Member member) {
//     if (value == 'edit') {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => EditMemberScreen(member: member),
//         ),
//       ).then((_) => _loadMembers());
//     } else if (value == 'delete') {
//       _confirmDelete(member);
//     }
//   }
//
//   void _confirmDelete(Member member) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text("Confirm Delete"),
//         content: Text("Delete ${member.name ?? "this member"}?"),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("Cancel"),
//           ),
//           TextButton(
//             onPressed: () async {
//               Navigator.pop(context);
//               setState(() => isLoading = true);
//
//               final response = await ApiService.deleteMember(member.id!);
//               if (mounted) {
//                 setState(() => isLoading = false);
//                 if (response.statusCode == 200) {
//                   _loadMembers();
//                   _scaffoldMessengerKey.currentState?.showSnackBar(
//                     const SnackBar(content: Text("Member deleted")),
//                   );
//                 } else {
//                   _scaffoldMessengerKey.currentState?.showSnackBar(
//                     const SnackBar(content: Text("Delete failed")),
//                   );
//                 }
//               }
//             },
//             child: const Text("Delete", style: TextStyle(color: Colors.red)),
//           ),
//         ],
//       ),
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldMessengerKey,
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Color(0xFF3661E2), Color(0xFF6A88E7)],
//           ),
//         ),
//         child: Column(
//           children: [
//             AppBar(
//               title: Text(
//                 "Dashboard",
//                 style: GoogleFonts.poppins(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 24.sp,
//                   color: Colors.white,
//                 ),
//               ),
//               backgroundColor: Colors.transparent,
//               elevation: 0,
//               actions: [
//                 CircleAvatar(
//                   backgroundColor: Colors.white,
//                   child: IconButton(
//                     icon: const Icon(Icons.person, color: Color(0xFF3661E2)),
//                     onPressed: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) =>  OrgProfileScreen(),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(right: 20.w),
//                   child: Stack(
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.notifications),
//                         onPressed: () {},
//                       ),
//                       if (notificationCount > 0)
//                         Positioned(
//                           right: 6,
//                           top: 6,
//                           child: CircleAvatar(
//                             radius: 10,
//                             backgroundColor: Colors.red,
//                             child: Text(
//                               '$notificationCount',
//                               style: const TextStyle(
//                                 fontSize: 12,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(25.r),
//                     topRight: Radius.circular(25.r),
//                   ),
//                 ),
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.all(20.w),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: TextField(
//                               controller: _searchController,
//                               decoration: InputDecoration(
//                                 hintText: "Search members...",
//                                 prefixIcon: const Icon(Icons.search),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(12.r),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(width: 12.w),
//                           ElevatedButton.icon(
//                             onPressed: () => Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => AddMemberScreen(
//                                   onMemberAdded: _loadMembers,
//                                 ),
//                               ),
//                             ),
//                             icon: const Icon(Icons.add),
//                             label: const Text("Add"),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       child: isLoading
//                           ? const Center(child: CircularProgressIndicator())
//                           : filteredMembers.isEmpty
//                           ? Center(
//                         child: Text(
//                           "No members found",
//                           style: GoogleFonts.poppins(),
//                         ),
//                       )
//                           : ListView.builder(
//                         padding: EdgeInsets.symmetric(horizontal: 20.w),
//                         itemCount: filteredMembers.length,
//                         itemBuilder: (context, index) =>
//                             _buildMemberCard(filteredMembers[index]),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     key: _scaffoldMessengerKey,
//   //     body: Container(
//   //       decoration: const BoxDecoration(
//   //         gradient: LinearGradient(
//   //           begin: Alignment.topCenter,
//   //           end: Alignment.bottomCenter,
//   //           colors: [Color(0xFF3661E2), Color(0xFF6A88E7)],
//   //         ),
//   //       ),
//   //       child: Column(
//   //         children: [
//   //       AppBar(
//   //       title: Text(
//   //       "Dashboard",
//   //         style: GoogleFonts.poppins(
//   //           fontWeight: FontWeight.bold,
//   //           fontSize: 24.sp,
//   //           color: Colors.white,
//   //         ),
//   //       ),
//   //       backgroundColor: Colors.transparent,
//   //       elevation: 0,
//   //       actions: [
//   //         CircleAvatar(
//   //           backgroundColor: Colors.white,
//   //           child: IconButton(
//   //             icon: const Icon(Icons.person, color: Color(0xFF3661E2)),
//   //             onPressed: () => Navigator.push(
//   //               context,
//   //               MaterialPageRoute(
//   //                 builder: (context) =>  OrgProfileScreen(),
//   //               ),
//   //             ),
//   //           ),
//   //         ),
//   //         Padding(
//   //           padding: EdgeInsets.only(right: 20.w),
//   //           child: Stack(
//   //             children: [
//   //               IconButton(
//   //                 icon: const Icon(Icons.notifications),
//   //                 onPressed: () {},
//   //               ),
//   //               if (notificationCount > 0)
//   //                 Positioned(
//   //                   right: 6,
//   //                   top: 6,
//   //                   child: CircleAvatar(
//   //                     radius: 10,
//   //                     backgroundColor: Colors.red,
//   //                     child: Text(
//   //                       '$notificationCount',
//   //                       style: const TextStyle(
//   //                         fontSize: 12,
//   //                         color: Colors.white,
//   //                       ),
//   //                     ),
//   //                   ),
//   //                 ),
//   //             ],
//   //           ),
//   //         ),
//   //       ],
//   //     ),
//   //     Expanded(
//   //       child: Container(
//   //         decoration: BoxDecoration(
//   //           color: Colors.white,
//   //           borderRadius: BorderRadius.only(
//   //             topLeft: Radius.circular(25.r),
//   //             topRight: Radius.circular(25.r),
//   //           ),
//   //         ),
//   //         child: Column(
//   //             children: [
//   //         Padding(
//   //         padding: EdgeInsets.all(20.w),
//   //         child: Row(
//   //           children: [
//   //             Expanded(
//   //               child: TextField(
//   //                 controller: _searchController,
//   //                 decoration: InputDecoration(
//   //                   hintText: "Search members...",
//   //                   prefixIcon: const Icon(Icons.search),
//   //                   border: OutlineInputBorder(
//   //                     borderRadius: BorderRadius.circular(12.r),
//   //                   ),
//   //                 ),
//   //               ),
//   //             ),
//   //             SizedBox(width: 12.w),
//   //             ElevatedButton.icon(
//   //               onPressed: () => Navigator.push(
//   //                 context,
//   //                 MaterialPageRoute(
//   //                   builder: (context) => AddMemberScreen(
//   //                     onMemberAdded: _loadMembers,
//   //                   ),
//   //                 ),
//   //               ),
//   //               icon: const Icon(Icons.add),
//   //               label: const Text("Add"),
//   //             ),
//   //           ],
//   //         ),
//   //       ),
//   //       Expanded(
//   //         child: isLoading
//   //             ? const Center(child: CircularProgressIndicator())
//   //             : filteredMembers.isEmpty
//   //             ? Center(
//   //           child: Text(
//   //             "No members found",
//   //             style: GoogleFonts.poppins(),
//   //           ),
//   //         )
//   //             : ListView.builder(
//   //           padding: EdgeInsets.symmetric(horizontal: 20.w),
//   //           itemCount: filteredMembers.length,
//   //           itemBuilder: (context, index) =>
//   //               _buildMemberCard(filteredMembers[index]),
//   //         ),
//   //         ],
//   //       ),
//   //     ),
//   //   ),
//   //   ],
//   //   ),
//   //   ),
//   //   );
//   // }
// }