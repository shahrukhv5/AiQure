import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import '../../models/Member/member.dart';

class MemberController extends ChangeNotifier {
  final List<Member> _members = [];

  List<Member> get members => _members;

  // Add a member manually
  void addMember(Member member) {
    _members.add(member);
    notifyListeners();
  }
  // Delete a member
  void deleteMember(Member member) {
    _members.remove(member);
    notifyListeners();
  }
  // Bulk import members from Excel
  Future<void> bulkImportFromExcel() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xlsx'],
      );

      if (result != null) {
        PlatformFile file = result.files.first;
        var bytes = File(file.path!).readAsBytesSync();
        var excel = Excel.decodeBytes(bytes);

        for (var table in excel.tables.keys) {
          for (var row in excel.tables[table]!.rows) {
            if (row.length >= 6) {
              String name = row[0]?.value.toString() ?? '';
              String gender = row[1]?.value.toString() ?? '';
              String age = row[2]?.value.toString() ?? '';
              String email = row[3]?.value.toString() ?? '';
              String contact = row[4]?.value.toString() ?? '';
              String address = row[5]?.value.toString() ?? '';

              _members.add(
                Member(
                  name: name,
                  gender: gender,
                  age: age,
                  email: email,
                  contact: contact,
                  address: address,
                ),
              );
            }
          }
        }

        notifyListeners();
      }
    } catch (e) {
      print("Error picking file: $e");
    }
  }
}