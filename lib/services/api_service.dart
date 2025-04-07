// import 'package:aiqure/models/Member/member.dart';
// import 'package:aiqure/models/UserModel/user_model.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// import 'package:shared_preferences/shared_preferences.dart';
//
// class ApiService{
//   static const String baseUrl =
//       "https://2sflw15kpf.execute-api.us-east-1.amazonaws.com/dev";
//   static Future<UserModel?> verifyUser({String? contactNo, String? email}) async {
//     try {
//       final Map<String, dynamic> requestBody = {};
//
//       if (contactNo != null && contactNo.isNotEmpty) {
//         requestBody['contact_no'] = contactNo;
//       } else if (email != null && email.isNotEmpty) {
//         requestBody['email'] = email;
//       } else {
//         print("❌ Error: Both contactNo and email are empty");
//         return null;
//       }
//
//       print("🔹 Sending Request Body: ${jsonEncode(requestBody)}");
//
//       final response = await http.post(
//         Uri.parse("$baseUrl/login-handler"),
//         headers: {
//           "Content-Type": "application/json",
//           "Accept": "application/json",
//         },
//         body: jsonEncode(requestBody),
//       );
//
//       print("API Response: ${response.body}");
//
//       if (response.statusCode == 200) {
//         final Map<String, dynamic> responseData = jsonDecode(response.body);
//         final bodyData = responseData['body'];
//
//         if (bodyData != null && bodyData['user'] != null) {
//           UserModel user = UserModel.fromJson(bodyData['user']);
//           return user;
//         }
//       }
//
//       print("❌ User data is null in response");
//       return null;
//     } catch (e) {
//       print("❌ Error: $e");
//       return null;
//     }
//   }
//
//   // 🔹 Save user session
//   static Future<void> saveUserSession(UserModel user) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('user_data', jsonEncode(user.toJson()));
//     print("✅ User session saved");
//   }
//
//   // 🔹 Retrieve user session
//   static Future<UserModel?> getUserSession() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? userData = prefs.getString('user_data');
//
//     if (userData != null) {
//       print("✅ User session found");
//       return UserModel.fromJson(jsonDecode(userData));
//     }
//     return null;
//   }
//
//   // 🔹 Logout (Clear session)
//   static Future<void> logout() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.remove('user_data');
//     print("✅ User logged out");
//   }
//
//   // Add Member API
//   static Future<http.Response> addMember(List<Member> members) async {
//     final response = await http.post(
//       Uri.parse("$baseUrl/members/register-members"),
//       headers: {"Content-Type": "application/json"},
//       body: jsonEncode({"members": members.map((e) => e.toJson()).toList()}),
//     );
//     return response;
//   }
//
//   // List Members API
//   static Future<http.Response> listMembers() async {
//     final response = await http.get(
//       Uri.parse("$baseUrl/members/list-members"),
//     );
//     return response;
//   }
// // // Delete Member API
//   static Future<http.Response> deleteMember(int memberId) async {
//     final response = await http.delete(
//       Uri.parse("$baseUrl/members/register-members?id=$memberId"),
//     );
//     return response;
//   }
//
//   static Future<http.Response> updateMember(Member member) async {
//     final response = await http.put(
//       Uri.parse("$baseUrl/members/register-members"),
//       headers: {"Content-Type": "application/json"},
//       body: jsonEncode({
//         "members": [
//           {
//             "id": member.id,
//             "name": member.name,
//             "contact_no": member.contactNo,
//             "email": member.email,
//             "dob": member.dob,
//             "address": member.address,
//             "age": member.age,
//             "org_id": member.orgId,
//             "wallet_price": member.walletPrice,
//           }
//         ]
//       }),
//     );
//     return response;
//   }
// }
import 'package:aiqure/models/Member/member.dart';
import 'package:aiqure/models/UserModel/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ApiService{
  static const String baseUrl =
      "https://2sflw15kpf.execute-api.us-east-1.amazonaws.com/dev";
  static Future<UserModel?> verifyUser({String? contactNo, String? email}) async {
    try {
      final Map<String, dynamic> requestBody = {};

      if (contactNo != null && contactNo.isNotEmpty) {
        requestBody['contact_no'] = contactNo;
      } else if (email != null && email.isNotEmpty) {
        requestBody['email'] = email;
      } else {
        print("❌ Error: Both contactNo and email are empty");
        return null;
      }

      print("🔹 Sending Request Body: ${jsonEncode(requestBody)}");

      final response = await http.post(
        Uri.parse("$baseUrl/login-handler"),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode(requestBody),
      );

      print("API Response: ${response.body}");

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        final bodyData = responseData['body'];

        if (bodyData != null && bodyData['user'] != null) {
          UserModel user = UserModel.fromJson(bodyData['user']);
          return user;
        }
      }

      print("❌ User data is null in response");
      return null;
    } catch (e) {
      print("❌ Error: $e");
      return null;
    }
  }

  // 🔹 Save user session
  static Future<void> saveUserSession(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_data', jsonEncode(user.toJson()));
    print("✅ User session saved");
  }

  // 🔹 Retrieve user session
  static Future<UserModel?> getUserSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userData = prefs.getString('user_data');

    if (userData != null) {
      print("✅ User session found");
      return UserModel.fromJson(jsonDecode(userData));
    }
    return null;
  }

  // 🔹 Logout (Clear session)
  static Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_data');
    print("✅ User logged out");
  }

  // Add Member API
  static Future<http.Response> addMember(List<Member> members) async {
    final response = await http.post(
      Uri.parse("$baseUrl/members/register-members"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"members": members.map((e) => e.toJson()).toList()}),
    );
    return response;
  }

  // List Members API
  static Future<http.Response> listMembers() async {
    final response = await http.get(
      Uri.parse("$baseUrl/members/list-members"),
    );
    return response;
  }

  // Delete Member API
  static Future<http.Response> deleteMember(int memberId) async {
    final response = await http.delete(
      Uri.parse("$baseUrl/members/register-members?id=$memberId"),
    );
    return response;
  }

  static Future<http.Response> updateMember(Member member) async {
    final response = await http.put(
      Uri.parse("$baseUrl/members/register-members"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "members": [
          {
            "id": member.id,
            "name": member.name,
            "contact_no": member.contactNo,
            "email": member.email,
            "dob": member.dob,
            "address": member.address,
            "age": member.age,
            "org_id": member.orgId,
            "wallet_price": member.walletPrice,
            "gender": member.gender, // ✅ Added gender field
          }
        ]
      }),
    );
    return response;
  }
}