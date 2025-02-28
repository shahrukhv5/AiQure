import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../AddMemberScreen/add_member_screen.dart';

class MemberListScreen extends StatefulWidget {
  @override
  State<MemberListScreen> createState() => _MemberListScreenState();
}

class _MemberListScreenState extends State<MemberListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF6FF),
      appBar: AppBar(
        title: Text("Member List",
        style: TextStyle(color: Color(0xFFEFF6FF),
        fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue, //
        elevation: 4, //
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(12.w),
        itemCount: 10, // Replace with actual data count
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 4.w),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
              leading: CircleAvatar(
                backgroundColor: Colors.blue[100],
                child: Icon(Icons.person, color: Colors.blue),
              ),
              title: Text(
                "Member Name $index",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Contact: 1234567890"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.blue),
                    onPressed: () {
                      // edit functionality
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      //delete functionality
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => AddMemberScreen()),
          );
        },
        backgroundColor: Colors.blue,
        elevation: 6,
        child: Icon(Icons.add, size: 30.sp, color: Colors.white),
      ),
    );
  }
}
