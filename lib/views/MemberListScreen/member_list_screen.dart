import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../controllers/MemberController/member_controller.dart';
import '../../models/Member/member.dart';
import '../AddMemberScreen/add_member_screen.dart'; // Import the AddMemberScreen

class MemberListScreen extends StatefulWidget {
  @override
  State<MemberListScreen> createState() => _MemberListScreenState();
}

class _MemberListScreenState extends State<MemberListScreen> {
  TextEditingController _searchController = TextEditingController();
  List<Member> filteredMembers = [];

  @override
  void initState() {
    super.initState();
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
    final memberController = Provider.of<MemberController>(context, listen: false);

    setState(() {
      filteredMembers = memberController.members.where((member) {
        return member.name.toLowerCase().contains(query) ||
            member.contact.toLowerCase().contains(query) ||
            member.email.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final memberController = Provider.of<MemberController>(context);

    // Initialize filteredMembers with all members if empty
    if (filteredMembers.isEmpty) {
      filteredMembers = memberController.members;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Member List",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.sp,
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 8,
        backgroundColor: Color(0xFF3661E2),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search Bar with Add Button
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
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
                        prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
                        border: OutlineInputBorder(  // Add this to fix the missing border issue
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                        filled: true, // Make sure the text field has a background color
                        fillColor: Colors.white, // Background color
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddMemberScreen()),
                    );
                  },
                  icon: Icon(Icons.add, color: Colors.white),
                  label: Text("Add"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    backgroundColor: Color(0xFF3661E2),
                    elevation: 4,
                    shadowColor: Colors.black26,
                  ),
                ),
              ],
            ),
          ),
          // Member List
          Expanded(
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
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12.r),
                    onTap: () {
                      // Handle member tap (e.g., navigate to details)
                    },
                    child: Padding(
                      padding: EdgeInsets.all(12.w),
                      child: Row(
                        children: [
                          // Circle Avatar
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
                          // Member Details
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
                                  // Delete functionality
                                  memberController.deleteMember(member);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}