import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../controllers/MemberController/member_controller.dart';
import '../../models/Member/member.dart';
import '../AddMemberScreen/add_member_screen.dart';
import '../RequestScreen/request_screen.dart'; // Import the Request Screen

class MemberListScreen extends StatefulWidget {
  const MemberListScreen({super.key});

  @override
  State<MemberListScreen> createState() => _MemberListScreenState();
}

class _MemberListScreenState extends State<MemberListScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Member> filteredMembers = [];
  int notificationCount = 3; // Default notification count (change as needed)

  @override
  void initState() {
    super.initState();
    final memberController = Provider.of<MemberController>(
      context,
      listen: false,
    );
    filteredMembers = List.from(memberController.members); // Initialize list
    _searchController.addListener(_filterMembers);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterMembers);
    _searchController.dispose();
    super.dispose();
  }

  void _filterMembers() {
    final query = _searchController.text.toLowerCase();
    final memberController = Provider.of<MemberController>(
      context,
      listen: false,
    );

    if (query.isEmpty) {
      setState(() {
        filteredMembers = List.from(memberController.members);
      });
      return;
    }

    setState(() {
      filteredMembers = memberController.members.where((member) {
        return member.name.toLowerCase().contains(query) ||
            member.contact.toLowerCase().contains(query) ||
            member.email.toLowerCase().contains(query);
      }).toList();
    });
  }

  void _addMember(Member member) {
    final memberController = Provider.of<MemberController>(
      context,
      listen: false,
    );
    memberController.addMember(member); // Add to provider state
    setState(() {
      filteredMembers.add(member); // Add to dashboard UI
      notificationCount--; // Decrease notification count
    });
  }

  @override
  Widget build(BuildContext context) {
    final memberController = Provider.of<MemberController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dashboard",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.sp,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Stack(
              children: [
                IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () async {
                    final acceptedUsers = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RequestScreen(
                          onAccept: _addMember,
                        ),
                      ),
                    );

                    if (acceptedUsers != null) {
                      setState(() {
                        notificationCount = acceptedUsers.length;
                      });
                    }
                  },
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
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Color(0xFF3661E2),
        child: Column(
          children: [
            // Search Bar with Add Button
            Container(
              decoration: BoxDecoration(color: Color(0xFF3661E2)),
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: "Search by Name, Contact, or Email",
                            hintStyle: TextStyle(color: Colors.grey.shade400),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey.shade600,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 14.h,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddMemberScreen(),
                          ),
                        );
                      },
                      icon: Icon(Icons.add),
                      label: Text("Add", style: TextStyle(color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 14.h,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        backgroundColor: Color(0xFFFFFFFF),
                        elevation: 8,
                        shadowColor: Colors.black26,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Member List
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.r),
                    topRight: Radius.circular(25.r),
                  ),
                  color: Color(0xFFFFFFFF),
                ),
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  itemCount: filteredMembers.length,
                  itemBuilder: (context, index) {
                    final member = filteredMembers[index];

                    return Card(
                      elevation: 4,
                      margin: EdgeInsets.symmetric(vertical: 8.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(12.w),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(0xFF3661E2).withOpacity(0.8),
                              radius: 24.r,
                              child: Text(
                                member.name[0].toUpperCase(),
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 16.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    member.name,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    "Contact: ${member.contact}",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  Text(
                                    "Email: ${member.email}",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Edit and Delete Icons
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit, color: Colors.blue),
                                  onPressed: () {
                                    // Edit functionality
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed: () {
                                    memberController.deleteMember(member);
                                    setState(() {
                                      filteredMembers.remove(member);
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
