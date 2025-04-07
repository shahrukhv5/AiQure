// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../models/Member/member.dart';
// import '../../controllers/MemberController/member_controller.dart';
//
// class EditMemberScreen extends StatefulWidget {
//   final Member member;
//
//   EditMemberScreen({required this.member});
//
//   @override
//   _EditMemberScreenState createState() => _EditMemberScreenState();
// }
//
// class _EditMemberScreenState extends State<EditMemberScreen> {
//   final _formKey = GlobalKey<FormState>();
//
//   late TextEditingController nameController;
//   late TextEditingController contactController;
//   late TextEditingController emailController;
//   late TextEditingController dobController;
//   late TextEditingController addressController;
//   late TextEditingController ageController;
//   late TextEditingController walletController;
//
//   @override
//   void initState() {
//     super.initState();
//     nameController = TextEditingController(text: widget.member.name);
//     contactController = TextEditingController(text: widget.member.contactNo);
//     emailController = TextEditingController(text: widget.member.email);
//     dobController = TextEditingController(text: widget.member.dob);
//     addressController = TextEditingController(text: widget.member.address);
//     ageController = TextEditingController(text: widget.member.age.toString());
//     walletController = TextEditingController(text: widget.member.walletPrice.toString());
//   }
//
//   @override
//   void dispose() {
//     nameController.dispose();
//     contactController.dispose();
//     emailController.dispose();
//     dobController.dispose();
//     addressController.dispose();
//     ageController.dispose();
//     walletController.dispose();
//     super.dispose();
//   }
//
//   void updateMember() async {
//     if (!_formKey.currentState!.validate()) return;
//
//     Member updatedMember = Member(
//       id: widget.member.id,
//       name: nameController.text,
//       contactNo: contactController.text,
//       email: emailController.text,
//       dob: dobController.text,
//       address: addressController.text,
//       age: int.tryParse(ageController.text) ?? 0,
//       orgId: widget.member.orgId,
//       walletPrice: double.tryParse(walletController.text) ?? 0.0,
//     );
//
//     final memberController = Provider.of<MemberController>(context, listen: false);
//     await memberController.updateMember(updatedMember);
//
//     Navigator.pop(context, updatedMember); // Return updated member
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Edit Member")),
//       body: Padding(
//         padding: EdgeInsets.all(16),
//         child: Form(
//           key: _formKey,
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 TextFormField(
//                   controller: nameController,
//                   decoration: InputDecoration(labelText: "Name"),
//                   validator: (value) => value!.isEmpty ? "Enter a name" : null,
//                 ),
//                 TextFormField(
//                   controller: contactController,
//                   decoration: InputDecoration(labelText: "Contact No"),
//                   validator: (value) => value!.isEmpty ? "Enter a contact number" : null,
//                 ),
//                 TextFormField(
//                   controller: emailController,
//                   decoration: InputDecoration(labelText: "Email"),
//                   validator: (value) => value!.isEmpty ? "Enter an email" : null,
//                 ),
//                 TextFormField(
//                   controller: dobController,
//                   decoration: InputDecoration(labelText: "Date of Birth"),
//                   validator: (value) => value!.isEmpty ? "Enter DOB" : null,
//                 ),
//                 TextFormField(
//                   controller: addressController,
//                   decoration: InputDecoration(labelText: "Address"),
//                 ),
//                 TextFormField(
//                   controller: ageController,
//                   decoration: InputDecoration(labelText: "Age"),
//                   keyboardType: TextInputType.number,
//                 ),
//                 TextFormField(
//                   controller: walletController,
//                   decoration: InputDecoration(labelText: "Wallet Price"),
//                   keyboardType: TextInputType.number,
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: updateMember,
//                   child: Text("Update"),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// -------------------------------------------------------------
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../models/Member/member.dart';
// import '../../controllers/MemberController/member_controller.dart';
//
// class EditMemberScreen extends StatefulWidget {
//   final Member member;
//
//   EditMemberScreen({required this.member});
//
//   @override
//   _EditMemberScreenState createState() => _EditMemberScreenState();
// }
//
// class _EditMemberScreenState extends State<EditMemberScreen> {
//   final _formKey = GlobalKey<FormState>();
//
//   late TextEditingController nameController;
//   late TextEditingController contactController;
//   late TextEditingController emailController;
//   late TextEditingController dobController;
//   late TextEditingController addressController;
//   late TextEditingController ageController;
//   late TextEditingController walletController;
//
//   bool _isLoading = false; // Loading state
//
//   @override
//   void initState() {
//     super.initState();
//     nameController = TextEditingController(text: widget.member.name);
//     contactController = TextEditingController(text: widget.member.contactNo);
//     emailController = TextEditingController(text: widget.member.email);
//     dobController = TextEditingController(text: widget.member.dob);
//     addressController = TextEditingController(text: widget.member.address);
//     ageController = TextEditingController(text: widget.member.age.toString());
//     walletController = TextEditingController(text: widget.member.walletPrice.toString());
//   }
//
//   @override
//   void dispose() {
//     nameController.dispose();
//     contactController.dispose();
//     emailController.dispose();
//     dobController.dispose();
//     addressController.dispose();
//     ageController.dispose();
//     walletController.dispose();
//     super.dispose();
//   }
//
//   Future<void> _selectDate() async {
//     DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//     );
//
//     if (picked != null) {
//       setState(() {
//         dobController.text = picked.toIso8601String().split("T")[0]; // Format: YYYY-MM-DD
//       });
//     }
//   }
//
//   void updateMember() async {
//     if (!_formKey.currentState!.validate()) return;
//
//     setState(() {
//       _isLoading = true;
//     });
//
//     Member updatedMember = Member(
//       id: widget.member.id,
//       name: nameController.text,
//       contactNo: contactController.text,
//       email: emailController.text,
//       dob: dobController.text,
//       address: addressController.text,
//       age: int.tryParse(ageController.text) ?? 0,
//       orgId: widget.member.orgId,
//       walletPrice: double.tryParse(walletController.text) ?? 0.0,
//     );
//
//     final memberController = Provider.of<MemberController>(context, listen: false);
//     await memberController.updateMember(updatedMember);
//
//     setState(() {
//       _isLoading = false;
//     });
//
//     Navigator.pop(context, updatedMember);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Edit Member")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 _buildTextField(nameController, "Name", Icons.person),
//                 _buildTextField(contactController, "Contact No", Icons.phone),
//                 _buildTextField(emailController, "Email", Icons.email),
//                 _buildTextField(addressController, "Address", Icons.location_on),
//                 _buildDateField(dobController, "Date of Birth", Icons.calendar_today),
//                 _buildTextField(ageController, "Age", Icons.cake, inputType: TextInputType.number),
//                 _buildTextField(walletController, "Wallet Price", Icons.account_balance_wallet, inputType: TextInputType.number),
//                 const SizedBox(height: 20),
//                 _isLoading
//                     ? Center(child: CircularProgressIndicator()) // Show loader when updating
//                     : SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: updateMember,
//                     style: ElevatedButton.styleFrom(
//                       padding: EdgeInsets.symmetric(vertical: 12),
//                       textStyle: TextStyle(fontSize: 18),
//                     ),
//                     child: Text("Update Member"),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextField(TextEditingController controller, String label, IconData icon, {TextInputType inputType = TextInputType.text}) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 15.0),
//       child: TextFormField(
//         controller: controller,
//         keyboardType: inputType,
//         decoration: InputDecoration(
//           labelText: label,
//           prefixIcon: Icon(icon),
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//           filled: true,
//           // fillColor: Colors.grey[200],
//         ),
//         validator: (value) => value!.isEmpty ? "Enter $label" : null,
//       ),
//     );
//   }
//
//   Widget _buildDateField(TextEditingController controller, String label, IconData icon) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 15.0),
//       child: TextFormField(
//         controller: controller,
//         readOnly: true,
//         decoration: InputDecoration(
//           labelText: label,
//           prefixIcon: Icon(icon),
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//           filled: true,
//           // fillColor: Colors.grey[200],
//           suffixIcon: IconButton(
//             icon: Icon(Icons.calendar_today),
//             onPressed: _selectDate,
//           ),
//         ),
//         validator: (value) => value!.isEmpty ? "Enter $label" : null,
//       ),
//     );
//   }
// }
// -----------------------------------------------------------
// import 'package:flutter/material.dart';
// import '../../models/Member/member.dart';
// import '../../services/api_service.dart';
//
// class EditMemberScreen extends StatefulWidget {
//   final Member member;
//
//   const EditMemberScreen({required this.member});
//
//   @override
//   _EditMemberScreenState createState() => _EditMemberScreenState();
// }
//
// class _EditMemberScreenState extends State<EditMemberScreen> {
//   final _formKey = GlobalKey<FormState>();
//   late TextEditingController _nameController;
//   late TextEditingController _contactNoController;
//   late TextEditingController _emailController;
//   late TextEditingController _dobController;
//   late TextEditingController _addressController;
//   late TextEditingController _ageController;
//   late TextEditingController _walletPriceController;
//   bool isLoading = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _nameController = TextEditingController(text: widget.member.name);
//     _contactNoController = TextEditingController(text: widget.member.contactNo);
//     _emailController = TextEditingController(text: widget.member.email);
//     _dobController = TextEditingController(text: widget.member.dob);
//     _addressController = TextEditingController(text: widget.member.address);
//     _ageController = TextEditingController(text: widget.member.age?.toString());
//     _walletPriceController = TextEditingController(text: widget.member.walletPrice?.toString());
//   }
//
//   void _updateMember() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         isLoading = true; // Show loading indicator
//       });
//
//       final member = Member(
//         id: widget.member.id,
//         name: _nameController.text,
//         contactNo: _contactNoController.text,
//         email: _emailController.text,
//         dob: _dobController.text,
//         address: _addressController.text,
//         age: int.tryParse(_ageController.text),
//         orgId: widget.member.orgId,
//         walletPrice: double.tryParse(_walletPriceController.text),
//       );
//
//       final response = await ApiService.updateMember(member);
//       if (response.statusCode == 200) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Member updated successfully")),
//         );
//         Navigator.pop(context, true); // Return true to indicate success
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Failed to update member")),
//         );
//       }
//
//       setState(() {
//         isLoading = false; // Hide loading indicator
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Edit Member"),
//         // backgroundColor: Colors.transparent,
//         elevation: 0,
//         iconTheme: IconThemeData(color: Colors.white),
//       ),
//       extendBodyBehindAppBar: true,
//       body: Container(
//         color: Colors.grey.shade200,
//         child: isLoading
//             ? Center(child: CircularProgressIndicator(color: Colors.white))
//             : Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: ListView(
//               children: [
//                 SizedBox(height: 80), // Space for the app bar
//                 Card(
//                   elevation: 4,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       children: [
//                         TextFormField(
//                           controller: _nameController,
//                           decoration: InputDecoration(
//                             labelText: "Name",
//                             prefixIcon: Icon(Icons.person),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return "Please enter name";
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(height: 16),
//                         TextFormField(
//                           controller: _contactNoController,
//                           decoration: InputDecoration(
//                             labelText: "Contact Number",
//                             prefixIcon: Icon(Icons.phone),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return "Please enter contact number";
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(height: 16),
//                         TextFormField(
//                           controller: _emailController,
//                           decoration: InputDecoration(
//                             labelText: "Email",
//                             prefixIcon: Icon(Icons.email),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return "Please enter email";
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(height: 16),
//                         TextFormField(
//                           controller: _dobController,
//                           decoration: InputDecoration(
//                             labelText: "Date of Birth (YYYY-MM-DD)",
//                             prefixIcon: Icon(Icons.calendar_today),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return "Please enter date of birth";
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(height: 16),
//                         TextFormField(
//                           controller: _addressController,
//                           decoration: InputDecoration(
//                             labelText: "Address",
//                             prefixIcon: Icon(Icons.home),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return "Please enter address";
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(height: 16),
//                         TextFormField(
//                           controller: _ageController,
//                           decoration: InputDecoration(
//                             labelText: "Age",
//                             prefixIcon: Icon(Icons.cake),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return "Please enter age";
//                             }
//                             if (int.tryParse(value) == null) {
//                               return "Please enter a valid age";
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(height: 16),
//                         TextFormField(
//                           controller: _walletPriceController,
//                           decoration: InputDecoration(
//                             labelText: "Wallet Price",
//                             prefixIcon: Icon(Icons.attach_money),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return "Please enter wallet price";
//                             }
//                             if (double.tryParse(value) == null) {
//                               return "Please enter a valid wallet price";
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(height: 20),
//                         Container(
//                           width: double.infinity,
//                           height: 50,
//                           decoration: BoxDecoration(
//                             gradient: LinearGradient(
//                               colors: [Colors.blue.shade600, Colors.blue.shade400],
//                               begin: Alignment.topLeft,
//                               end: Alignment.bottomRight,
//                             ),
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                           child: ElevatedButton(
//                             onPressed: _updateMember,
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.transparent,
//                               shadowColor: Colors.transparent,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                             child: Text(
//                               "Update Member",
//                               style: TextStyle(fontSize: 18, color: Colors.white),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts
import '../../models/Member/member.dart';
import '../../services/api_service.dart';

class EditMemberScreen extends StatefulWidget {
  final Member member;

  const EditMemberScreen({required this.member});

  @override
  _EditMemberScreenState createState() => _EditMemberScreenState();
}

class _EditMemberScreenState extends State<EditMemberScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _contactNoController;
  late TextEditingController _emailController;
  late TextEditingController _dobController;
  late TextEditingController _addressController;
  late TextEditingController _ageController;
  late TextEditingController _walletPriceController;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.member.name);
    _contactNoController = TextEditingController(text: widget.member.contactNo);
    _emailController = TextEditingController(text: widget.member.email);
    _dobController = TextEditingController(text: widget.member.dob);
    _addressController = TextEditingController(text: widget.member.address);
    _ageController = TextEditingController(text: widget.member.age?.toString());
    _walletPriceController = TextEditingController(text: widget.member.walletPrice?.toString());
  }

  void _updateMember() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true; // Show loading indicator
      });

      final member = Member(
        id: widget.member.id,
        name: _nameController.text,
        contactNo: _contactNoController.text,
        email: _emailController.text,
        dob: _dobController.text,
        address: _addressController.text,
        age: int.tryParse(_ageController.text),
        orgId: widget.member.orgId,
        walletPrice: double.tryParse(_walletPriceController.text),
      );

      final response = await ApiService.updateMember(member);
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Member updated successfully")),
        );
        Navigator.pop(context, true); // Return true to indicate success
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to update member")),
        );
      }

      setState(() {
        isLoading = false; // Hide loading indicator
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Member",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 24.sp,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0xFF3661E2), // AppBar color
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF3661E2), Color(0xFF6A88E7)],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Background color for the rounded container
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.r), // Rounded top-left corner
                    topRight: Radius.circular(25.r), // Rounded top-right corner
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Edit Member Details",
                          style: GoogleFonts.poppins(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3661E2),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        _buildTextField(_nameController, "Name", Icons.person),
                        _buildTextField(_contactNoController, "Contact Number", Icons.phone),
                        _buildTextField(_emailController, "Email", Icons.email),
                        _buildTextField(_dobController, "Date of Birth (YYYY-MM-DD)", Icons.calendar_today),
                        _buildTextField(_addressController, "Address", Icons.home),
                        _buildTextField(_ageController, "Age", Icons.cake, inputType: TextInputType.number),
                        _buildTextField(_walletPriceController, "Wallet Price", Icons.attach_money, inputType: TextInputType.number),
                        SizedBox(height: 20.h),
                        _buildActionButton("Update Member", _updateMember),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon, {TextInputType inputType = TextInputType.text}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Color(0xFF3661E2)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(color: Color(0xFF3661E2)),
          ),
          filled: true,
          fillColor: Colors.grey.shade100, // Light grey background for input fields
        ),
        validator: (value) => value == null || value.trim().isEmpty ? "Required field" : null,
      ),
    );
  }

  Widget _buildActionButton(String label, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF3661E2), // Button color
          padding: EdgeInsets.symmetric(vertical: 16.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          elevation: 5,
        ),
        child: isLoading
            ? CircularProgressIndicator(color: Colors.white)
            : Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}