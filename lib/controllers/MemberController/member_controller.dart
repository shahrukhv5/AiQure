import 'dart:convert';
import 'dart:io';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../models/Member/member.dart';

class MemberController with ChangeNotifier {
  List<Member> _members = [];
  List<Member> get members => _members;
  final String _baseUrl =
      "https://2sflw15kpf.execute-api.us-east-1.amazonaws.com/dev/members";

  // Fetch Members from API
  Future<void> fetchMembers() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/list-members'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        if (responseData.containsKey("body") && responseData["body"].containsKey("data")) {
          final List<dynamic> memberList = responseData["body"]["data"];
          _members = memberList.map((member) => Member.fromJson(member)).toList();
          print("📂 Fetched Members: $_members"); // ✅ Debugging print
        } else {
          print("⚠️ Invalid API response: Missing 'data' key");
        }
      } else {
        print("❌ Failed to load members: ${response.statusCode}");
      }
    } catch (e) {
      print("❌ Error fetching members: $e");
    }
    notifyListeners(); // ✅ Always notify, even if an error occurs
  }


  // Add a single member
  Future<void> addMember(Member member) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/register-members'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "members": [member.toJson()],
        }),
      );

      if (response.statusCode == 200) {
        _members.add(member);
        notifyListeners();
      } else {
        throw Exception('Failed to add member: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error adding member: $e');
    }
  }

  // Update Member
  Future<void> updateMember(Member member) async {
    try {
      final response = await http.put(
        Uri.parse('$_baseUrl/register-members'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "members": [member.toJson()],
        }),
      );

      if (response.statusCode == 200) {
        final index = _members.indexWhere((m) => m.id == member.id);
        if (index != -1) {
          _members[index] = member;
          notifyListeners();
        }
      } else {
        throw Exception('Failed to update member: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error updating member: $e');
    }
  }

  // Delete Member
  Future<void> deleteMember(int id) async {
    try {
      final response = await http.delete(
        Uri.parse('$_baseUrl/register-members?id=$id'),
      );
      if (response.statusCode == 200) {
        _members.removeWhere((member) => member.id == id);
        notifyListeners();
      } else {
        throw Exception('Failed to delete member: ${response.body}');
      }
    } catch (e) {
      throw Exception('Error deleting member: $e');
    }
  }


  // Future<void> bulkImportFromExcel() async {
  //   try {
  //     FilePickerResult? result = await FilePicker.platform.pickFiles(
  //       type: FileType.custom,
  //       allowedExtensions: ['xlsx'],
  //     );
  //
  //     if (result == null) return; // No file selected
  //
  //     PlatformFile file = result.files.first;
  //     var bytes = File(file.path!).readAsBytesSync();
  //     var excel = Excel.decodeBytes(bytes);
  //
  //     List<Member> membersList = [];
  //
  //     for (var table in excel.tables.keys) {
  //       for (var row in excel.tables[table]!.rows) {
  //         // Ensure row has enough columns before accessing them
  //         if (row.length < 7) { // Adjust this based on the required columns
  //           debugPrint("⚠️ Skipping row due to insufficient columns: $row");
  //           continue;
  //         }
  //
  //         Member member = Member(
  //           id: row.length > 7 ? int.tryParse(row[7]?.value?.toString() ?? "0") ?? 0 : 0,
  //           name: row.length > 0 ? row[0]?.value?.toString() ?? "" : "",
  //           contactNo: row.length > 1 ? row[1]?.value?.toString() ?? "" : "",
  //           email: row.length > 2 ? row[2]?.value?.toString() ?? "" : "",
  //           dob: row.length > 3 ? row[3]?.value?.toString() ?? "" : "",
  //           address: row.length > 4 ? row[4]?.value?.toString() ?? "" : "",
  //           age: row.length > 5 ? int.tryParse(row[5]?.value?.toString() ?? "0") ?? 0 : 0,
  //           walletPrice: row.length > 6 ? double.tryParse(row[6]?.value?.toString() ?? "0.0") ?? 0.0 : 0.0,
  //           orgId: row.length > 8 ? int.tryParse(row[8]?.value?.toString() ?? "0") ?? 0 : 0,
  //         );
  //
  //         membersList.add(member);
  //         debugPrint("✅ Imported Member: ${member.toJson()}");
  //       }
  //     }
  //
  //     if (membersList.isNotEmpty) {
  //       _members.addAll(membersList); // Add to local list
  //       notifyListeners(); // Update UI immediately
  //
  //       final url = Uri.parse("$_baseUrl/register-members");
  //       final response = await http.post(
  //         url,
  //         headers: {'Content-Type': 'application/json'},
  //         body: jsonEncode({"members": membersList}),
  //       );
  //
  //       if (response.statusCode == 200) {
  //         debugPrint("✅ Members Imported Successfully!");
  //         notifyListeners(); // Ensure UI updates
  //       } else {
  //         throw Exception("❌ Failed to import members: ${response.body}");
  //       }
  //     }
  //   } catch (e) {
  //     debugPrint("❌ Error during bulk import: $e");
  //   }
  // }
}

