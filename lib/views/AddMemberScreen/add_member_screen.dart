// import 'dart:convert';
// import 'dart:io';
// import 'package:aiqure/services/api_service.dart';
// import 'package:aiqure/views/MemberListScreen/member_list_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:excel/excel.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../../models/Member/member.dart';
//
// class AddMemberScreen extends StatefulWidget {
//   final VoidCallback onMemberAdded; // Callback to refresh the list
//
//   AddMemberScreen({required this.onMemberAdded, Key? key}) : super(key: key);
//
//   @override
//   _AddMemberScreenState createState() => _AddMemberScreenState();
// }
//
// class _AddMemberScreenState extends State<AddMemberScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _ageController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _contactController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//   final TextEditingController _dobController = TextEditingController();
//   final TextEditingController _walletPriceController = TextEditingController();
//
//   String? selectedGender;
//   bool _isLoading = false;
//
//   Future<void> _addMember() async {
//     if (!_formKey.currentState!.validate()) return;
//
//     if (mounted) {
//       setState(() => _isLoading = true);
//     }
//
//     // ✅ Create a Member object
//     final member = Member(
//       id: 0,
//       orgId: 0,
//       name: _nameController.text.trim(),
//       age: int.tryParse(_ageController.text.trim()) ?? 0,
//       email: _emailController.text.trim(),
//       contactNo: _contactController.text.trim(),
//       address: _addressController.text.trim(),
//       dob: _dobController.text.trim(),
//       walletPrice: double.tryParse(_walletPriceController.text.trim()) ?? 0.0,
//     );
//
//     try {
//       // ✅ Call API to add member
//       final response = await ApiService.addMember([member]);
//
//       print("Add Member Response: ${response.body}");
//
//       if (response.statusCode == 200) {
//         if (mounted) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text("✅ Member added successfully!")),
//           );
//         }
//
//         // ✅ Instead of popping, update UI with new member
//         widget.onMemberAdded(); // Ensure this refreshes the UI
//
//         // ✅ Clear input fields after adding
//         _nameController.clear();
//         _ageController.clear();
//         _emailController.clear();
//         _contactController.clear();
//         _addressController.clear();
//         _dobController.clear();
//         _walletPriceController.clear();
//
//         // ✅ Hide keyboard
//         FocusScope.of(context).unfocus();
//       } else {
//         final responseBody = jsonDecode(response.body);
//         String errorMessage = "Failed to add member";
//
//         if (responseBody is Map && responseBody.containsKey('message')) {
//           errorMessage = responseBody['message'];
//         }
//
//         if (mounted) {
//           ScaffoldMessenger.of(
//             context,
//           ).showSnackBar(SnackBar(content: Text("❌ $errorMessage")));
//         }
//       }
//     } catch (error) {
//       if (mounted) {
//         ScaffoldMessenger.of(
//           context,
//         ).showSnackBar(SnackBar(content: Text("❌ Error: $error")));
//       }
//     } finally {
//       if (mounted) {
//         setState(() => _isLoading = false);
//       }
//     }
//   }
//
//   Future<void> _bulkImportFromExcel() async {
//     try {
//       // Pick an Excel file
//       FilePickerResult? result = await FilePicker.platform.pickFiles(
//         type: FileType.custom,
//         allowedExtensions: ['xlsx', 'xls'],
//       );
//
//       if (result == null) {
//         ScaffoldMessenger.of(
//           context,
//         ).showSnackBar(SnackBar(content: Text("❌ No file selected")));
//         return;
//       }
//
//       setState(() {
//         _isLoading = true; // Show loading indicator
//       });
//
//       // Read the Excel file
//       final file = result.files.single;
//
//       // Debugging: Print file details
//       print("File Name: ${file.name}");
//       print("File Size: ${file.size} bytes");
//       print("File Extension: ${file.extension}");
//       print("File Path: ${file.path}");
//
//       // Use the file path to read the file
//       final filePath = file.path;
//       if (filePath == null) {
//         ScaffoldMessenger.of(
//           context,
//         ).showSnackBar(SnackBar(content: Text("❌ File path is null")));
//         return;
//       }
//
//       final fileBytes = await File(filePath).readAsBytes();
//       final excel = Excel.decodeBytes(fileBytes);
//
//       // Debugging: Print Excel tables and rows
//       print("Excel Tables: ${excel.tables.keys}");
//       final sheet = excel.tables[excel.tables.keys.first]!;
//       print("First Sheet Rows: ${sheet.rows.length}");
//
//       // Parse Excel data into a list of Member objects
//       final members = <Member>[];
//       for (var row in sheet.rows) {
//         if (row.length >= 7) {
//           // Ensure the row has enough columns
//           print("Row Data: ${row.map((cell) => cell?.value).toList()}");
//
//           final name = row[0]?.value.toString() ?? "";
//           final contactNo = row[1]?.value.toString() ?? "";
//           final email = row[2]?.value.toString() ?? "";
//           final dob = _parseDate(
//             row[3]?.value.toString() ?? "",
//           ); // Parse the date
//           final address = row[4]?.value.toString() ?? "";
//           final age = int.tryParse(row[5]?.value.toString() ?? "") ?? 0;
//           final walletPrice =
//               double.tryParse(row[6]?.value.toString() ?? "") ?? 0.0;
//
//           // Skip empty rows or rows with invalid dates
//           if (name.isEmpty &&
//               contactNo.isEmpty &&
//               email.isEmpty &&
//               dob.isEmpty &&
//               address.isEmpty &&
//               age == 0 &&
//               walletPrice == 0.0) {
//             continue;
//           }
//
//           if (dob.isEmpty) {
//             print(
//               "Skipping row due to invalid date: ${row[3]?.value.toString()}",
//             );
//             continue;
//           }
//
//           final member = Member(
//             name: name,
//             contactNo: contactNo,
//             email: email,
//             dob: dob,
//             address: address,
//             age: age,
//             orgId: 1, // Replace with actual org ID from login
//             walletPrice: walletPrice,
//           );
//           members.add(member);
//         }
//       }
//
//       // Send the list of members to the API
//       final response = await ApiService.addMember(members);
//       print("Import Response: ${response.statusCode}");
//       print("Import Body: ${response.body}");
//
//       if (response.statusCode == 200) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("✅ Members imported successfully!")),
//         );
//         widget.onMemberAdded(); // Trigger the callback to refresh the list
//       } else {
//         ScaffoldMessenger.of(
//           context,
//         ).showSnackBar(SnackBar(content: Text("❌ Failed to import members")));
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text("❌ Error importing members: $e")));
//     } finally {
//       if (mounted) {
//         setState(() {
//           _isLoading = false; // Hide loading indicator
//         });
//       }
//     }
//   }
//
//   String _parseDate(String dateString) {
//     try {
//       // Parse the ISO 8601 date string
//       final dateTime = DateTime.parse(dateString);
//       // Format it as YYYY-MM-DD
//       return "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
//     } catch (e) {
//       print("Error parsing date: $e");
//       return ""; // Return an empty string if parsing fails
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Add Member",
//           style: GoogleFonts.poppins(
//             fontWeight: FontWeight.bold,
//             fontSize: 24.sp,
//             color: Colors.white,
//           ),
//         ),
//         automaticallyImplyLeading: false,
//         centerTitle: true,
//         backgroundColor: Color(0xFF3661E2), // AppBar color
//         elevation: 0,
//       ),
//       body: Container(
//         color: Color(0xFF3661E2), // Background color for the top part
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   color:
//                       Colors
//                           .white, // Background color for the rounded container
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(25.r), // Rounded top-left corner
//                     topRight: Radius.circular(25.r), // Rounded top-right corner
//                   ),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.all(20.w),
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text(
//                           "Enter Member Details",
//                           style: GoogleFonts.poppins(
//                             fontSize: 30.sp,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFF3661E2),
//                           ),
//                         ),
//                         SizedBox(height: 20.h),
//                         _buildTextField(_nameController, "Name", Icons.person),
//                         _buildDropdown("Gender", Icons.wc, [
//                           "Male",
//                           "Female",
//                           "Other",
//                         ]),
//                         _buildTextField(
//                           _ageController,
//                           "Age",
//                           Icons.cake,
//                           inputType: TextInputType.number,
//                         ),
//                         _buildTextField(
//                           _emailController,
//                           "Email Address",
//                           Icons.email,
//                           inputType: TextInputType.emailAddress,
//                         ),
//                         _buildTextField(
//                           _contactController,
//                           "Contact Number",
//                           Icons.phone,
//                           inputType: TextInputType.phone,
//                         ),
//                         _buildTextField(
//                           _addressController,
//                           "Address",
//                           Icons.location_on,
//                         ),
//                         _buildDateField(
//                           _dobController,
//                           "Date of Birth",
//                           Icons.calendar_today,
//                         ),
//                         _buildTextField(
//                           _walletPriceController,
//                           "Wallet Price",
//                           Icons.account_balance_wallet,
//                           inputType: TextInputType.number,
//                         ),
//                         SizedBox(height: 20.h),
//                         _buildActionButton("Add", _addMember),
//                         SizedBox(height: 10.h),
//                         _buildActionButton(
//                           "Bulk Import from Excel",
//                           _bulkImportFromExcel,
//                         ),
//                         SizedBox(height: 10.h),
//                         _buildActionButton("View List", () {
//                           // Navigate to MemberListScreen with a smooth transition
//                           Navigator.pushReplacement(
//                             context,
//                             PageRouteBuilder(
//                               pageBuilder:
//                                   (context, animation, secondaryAnimation) =>
//                                       MemberListScreen(),
//                               transitionsBuilder: (
//                                 context,
//                                 animation,
//                                 secondaryAnimation,
//                                 child,
//                               ) {
//                                 const begin = Offset(
//                                   1.0,
//                                   0.0,
//                                 ); // Slide from right to left
//                                 const end = Offset.zero;
//                                 const curve = Curves.easeInOut;
//
//                                 var tween = Tween(
//                                   begin: begin,
//                                   end: end,
//                                 ).chain(CurveTween(curve: curve));
//                                 var offsetAnimation = animation.drive(tween);
//
//                                 return SlideTransition(
//                                   position: offsetAnimation,
//                                   child: child,
//                                 );
//                               },
//                               transitionDuration: Duration(milliseconds: 500),
//                             ),
//                           );
//                         }),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextField(
//     TextEditingController controller,
//     String label,
//     IconData icon, {
//     TextInputType inputType = TextInputType.text,
//   }) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 12.h),
//       child: TextFormField(
//         controller: controller,
//         keyboardType: inputType,
//         decoration: InputDecoration(
//           labelText: label,
//           prefixIcon: Icon(icon, color: Color(0xFF3661E2)),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12.r),
//             borderSide: BorderSide(color: Color(0xFF3661E2)),
//           ),
//           filled: true,
//           fillColor:
//               Colors.grey.shade100, // Light grey background for input fields
//         ),
//         validator:
//             (value) =>
//                 value == null || value.trim().isEmpty ? "Required field" : null,
//       ),
//     );
//   }
//
//   Widget _buildDropdown(String label, IconData icon, List<String> items) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 12.h),
//       child: DropdownButtonFormField<String>(
//         decoration: InputDecoration(
//           labelText: label,
//           prefixIcon: Icon(icon, color: Color(0xFF3661E2)),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12.r),
//             borderSide: BorderSide(color: Color(0xFF3661E2)),
//           ),
//           filled: true,
//           fillColor: Colors.grey.shade100, // Light grey background for dropdown
//         ),
//         value: selectedGender,
//         items:
//             items
//                 .map((item) => DropdownMenuItem(value: item, child: Text(item)))
//                 .toList(),
//         onChanged: (value) => setState(() => selectedGender = value),
//         validator: (value) => value == null ? "Please select gender" : null,
//       ),
//     );
//   }
//
//   Widget _buildDateField(
//     TextEditingController controller,
//     String label,
//     IconData icon,
//   ) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 12.h),
//       child: TextFormField(
//         controller: controller,
//         readOnly: true,
//         decoration: InputDecoration(
//           labelText: label,
//           prefixIcon: Icon(icon, color: Color(0xFF3661E2)),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12.r),
//             borderSide: BorderSide(color: Color(0xFF3661E2)),
//           ),
//           filled: true,
//           fillColor:
//               Colors.grey.shade100, // Light grey background for date field
//           suffixIcon: IconButton(
//             icon: Icon(Icons.calendar_today, color: Color(0xFF3661E2)),
//             onPressed: _selectDate,
//           ),
//         ),
//         validator:
//             (value) => value == null || value.isEmpty ? "Required field" : null,
//       ),
//     );
//   }
//
//   Widget _buildActionButton(String label, VoidCallback onPressed) {
//     return SizedBox(
//       width: double.infinity,
//       child: ElevatedButton(
//         onPressed: _isLoading ? null : onPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Color(0xFF3661E2), // Button color
//           padding: EdgeInsets.symmetric(vertical: 16.h),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(12.r),
//           ),
//           elevation: 5,
//         ),
//         child:
//             _isLoading
//                 ? CircularProgressIndicator(color: Colors.white)
//                 : Text(
//                   label,
//                   style: GoogleFonts.poppins(
//                     fontSize: 16.sp,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//       ),
//     );
//   }
//
//   Future<void> _selectDate() async {
//     DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//     );
//     if (pickedDate != null) {
//       setState(
//         () => _dobController.text = "${pickedDate.toLocal()}".split(' ')[0],
//       );
//     }
//   }
// }
import 'dart:convert';
import 'dart:io';
import 'package:aiqure/services/api_service.dart';
import 'package:aiqure/views/MemberListScreen/member_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:file_picker/file_picker.dart';
import 'package:excel/excel.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/Member/member.dart';

class AddMemberScreen extends StatefulWidget {
  final VoidCallback onMemberAdded;

  const AddMemberScreen({required this.onMemberAdded, Key? key}) : super(key: key);

  @override
  _AddMemberScreenState createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _walletPriceController = TextEditingController();
  String? selectedGender;
  bool _isLoading = false;

  Future<void> _addMember() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final member = Member(
      id: 0,
      orgId: 0,
      name: _nameController.text.trim(),
      age: int.tryParse(_ageController.text.trim()) ?? 0,
      email: _emailController.text.trim(),
      contactNo: _contactController.text.trim(),
      address: _addressController.text.trim(),
      dob: _dobController.text.trim(),
      walletPrice: double.tryParse(_walletPriceController.text.trim()) ?? 0.0,
      gender: selectedGender,
    );

    try {
      final response = await ApiService.addMember([member]);

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("✅ Member added successfully!")),
        );
        widget.onMemberAdded();
        _clearForm();
        FocusScope.of(context).unfocus();
      } else {
        _handleErrorResponse(response);
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("❌ Error: $error")),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _clearForm() {
    _nameController.clear();
    _ageController.clear();
    _emailController.clear();
    _contactController.clear();
    _addressController.clear();
    _dobController.clear();
    _walletPriceController.clear();
    setState(() => selectedGender = null);
  }

  void _handleErrorResponse(dynamic response) {
    try {
      final responseBody = jsonDecode(response.body);
      String errorMessage = "Failed to add member";
      if (responseBody is Map && responseBody.containsKey('message')) {
        errorMessage = responseBody['message'];
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("❌ $errorMessage")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("❌ Error processing response")),
      );
    }
  }

  Future<void> _bulkImportFromExcel() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xlsx', 'xls'],
      );

      if (result == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("❌ No file selected")),
        );
        return;
      }

      setState(() => _isLoading = true);

      final file = result.files.single;
      final filePath = file.path;
      if (filePath == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("❌ File path is null")),
        );
        return;
      }

      final fileBytes = await File(filePath).readAsBytes();
      final excel = Excel.decodeBytes(fileBytes);
      final sheet = excel.tables[excel.tables.keys.first]!;

      final members = <Member>[];
      for (var row in sheet.rows) {
        if (row.length >= 8) {
          final name = row[0]?.value.toString() ?? "";
          final contactNo = row[1]?.value.toString() ?? "";
          final email = row[2]?.value.toString() ?? "";
          final dob = _parseDate(row[3]?.value.toString() ?? "");
          final address = row[4]?.value.toString() ?? "";
          final age = int.tryParse(row[5]?.value.toString() ?? "") ?? 0;
          final walletPrice = double.tryParse(row[6]?.value.toString() ?? "") ?? 0.0;
          final gender = row[7]?.value.toString() ?? "";

          if (name.isEmpty && contactNo.isEmpty && email.isEmpty &&
              dob.isEmpty && address.isEmpty && age == 0 &&
              walletPrice == 0.0 && gender.isEmpty) {
            continue;
          }

          if (dob.isEmpty) continue;

          members.add(Member(
            name: name,
            contactNo: contactNo,
            email: email,
            dob: dob,
            address: address,
            age: age,
            orgId: 1,
            walletPrice: walletPrice,
            gender: gender.isNotEmpty ? gender : null,
          ));
        }
      }

      final response = await ApiService.addMember(members);
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("✅ Members imported successfully!")),
        );
        widget.onMemberAdded();
      } else {
        _handleErrorResponse(response);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("❌ Error importing members: $e")),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  String _parseDate(String dateString) {
    try {
      final dateTime = DateTime.parse(dateString);
      return "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
    } catch (e) {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Member",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 24.sp,
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: const Color(0xFF3661E2),
        elevation: 0,
      ),
      body: Container(
        color: const Color(0xFF3661E2),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.r),
                    topRight: Radius.circular(25.r),
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
                          "Enter Member Details",
                          style: GoogleFonts.poppins(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF3661E2),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        _buildTextField(_nameController, "Name", Icons.person),
                        _buildDropdown("Gender", Icons.wc, ["Male", "Female", "Other"]),
                        _buildTextField(
                          _ageController,
                          "Age",
                          Icons.cake,
                          inputType: TextInputType.number,
                        ),
                        _buildTextField(
                          _emailController,
                          "Email Address",
                          Icons.email,
                          inputType: TextInputType.emailAddress,
                        ),
                        _buildTextField(
                          _contactController,
                          "Contact Number",
                          Icons.phone,
                          inputType: TextInputType.phone,
                        ),
                        _buildTextField(
                          _addressController,
                          "Address",
                          Icons.location_on,
                        ),
                        _buildDateField(
                          _dobController,
                          "Date of Birth",
                          Icons.calendar_today,
                        ),
                        _buildTextField(
                          _walletPriceController,
                          "Wallet Price",
                          Icons.account_balance_wallet,
                          inputType: TextInputType.number,
                        ),
                        SizedBox(height: 20.h),
                        _buildActionButton("Add", _addMember),
                        SizedBox(height: 10.h),
                        _buildActionButton("Bulk Import from Excel", _bulkImportFromExcel),
                        SizedBox(height: 10.h),
                        _buildActionButton("View List", () {
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => const MemberListScreen(),
                              transitionsBuilder: (_, animation, __, child) {
                                return SlideTransition(
                                  position: Tween<Offset>(
                                    begin: const Offset(1.0, 0.0),
                                    end: Offset.zero,
                                  ).animate(CurvedAnimation(
                                    parent: animation,
                                    curve: Curves.easeInOut,
                                  )),
                                  child: child,
                                );
                              },
                              transitionDuration: const Duration(milliseconds: 500),
                            ),
                          );
                        }),
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

  Widget _buildTextField(
      TextEditingController controller,
      String label,
      IconData icon, {
        TextInputType inputType = TextInputType.text,
      }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: const Color(0xFF3661E2)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(color: Color(0xFF3661E2)),
          ),
          filled: true,
          fillColor: Colors.grey.shade100,
        ),
        validator: (value) => value == null || value.trim().isEmpty ? "Required field" : null,
      ),
    );
  }

  Widget _buildDropdown(String label, IconData icon, List<String> items) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: const Color(0xFF3661E2)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(color: Color(0xFF3661E2)),
          ),
          filled: true,
          fillColor: Colors.grey.shade100,
        ),
        value: selectedGender,
        items: items.map((item) => DropdownMenuItem(
          value: item,
          child: Text(item),
        )).toList(),
        onChanged: (value) => setState(() => selectedGender = value),
        validator: (value) => value == null ? "Please select gender" : null,
      ),
    );
  }

  Widget _buildDateField(
      TextEditingController controller,
      String label,
      IconData icon,
      ) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: TextFormField(
        controller: controller,
        readOnly: true,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: const Color(0xFF3661E2)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(color: Color(0xFF3661E2)),
          ),
          filled: true,
          fillColor: Colors.grey.shade100,
          suffixIcon: IconButton(
            icon: const Icon(Icons.calendar_today, color: Color(0xFF3661E2)),
            onPressed: _selectDate,
          ),
        ),
        validator: (value) => value == null || value.isEmpty ? "Required field" : null,
      ),
    );
  }

  Widget _buildActionButton(String label, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3661E2),
          padding: EdgeInsets.symmetric(vertical: 16.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          elevation: 5,
        ),
        child: _isLoading
            ? const CircularProgressIndicator(color: Colors.white)
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

  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() => _dobController.text = "${pickedDate.toLocal()}".split(' ')[0]);
    }
  }
}