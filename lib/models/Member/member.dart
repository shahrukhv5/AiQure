// class Member {
//   final int? id;
//   final String? name;
//   final String? contactNo;
//   final String? email;
//   final String? dob;
//   final String? address;
//   final int? age;
//   final int? orgId;
//   final num? walletPrice; // ✅ Use num for flexibility (int & double)
//
//   Member({
//     this.id,
//     this.name,
//     this.contactNo,
//     this.email,
//     this.dob,
//     this.address,
//     this.age,
//     this.orgId,
//     this.walletPrice,
//   });
//
//   @override
//   String toString() {
//     return 'Member(id: $id, name: $name, contactNo: $contactNo, email: $email, dob: $dob, address: $address, age: $age, orgId: $orgId, walletPrice: $walletPrice)';
//   }
//
//   // ✅ Factory constructor to create a Member from JSON
//   factory Member.fromJson(Map<String, dynamic> json) {
//     return Member(
//       id: json['id'] as int?,
//       name: json['name'] as String?,
//       contactNo: json['contact_no'] as String?,
//       email: json['email'] as String?,
//       dob: json['dob'] as String?,
//       address: json['address'] as String?,
//       age: json['age'] as int?,
//       orgId: json['org_id'] as int?,
//       walletPrice: json['wallet_price'] as num?, // ✅ Explicitly cast to num
//     );
//   }
//
//   // ✅ Method to convert Member object to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       "id": id,
//       "name": name,
//       "contact_no": contactNo,
//       "email": email,
//       "dob": dob,
//       "address": address,
//       "age": age,
//       "org_id": orgId,
//       "wallet_price": walletPrice,
//     };
//   }
// }
class Member {
  final int? id;
  final String? name;
  final String? contactNo;
  final String? email;
  final String? dob;
  final String? address;
  final int? age;
  final int? orgId;
  final num? walletPrice; // ✅ Use num for flexibility (int & double)
  final String? gender;   // ✅ Added gender field

  Member({
    this.id,
    this.name,
    this.contactNo,
    this.email,
    this.dob,
    this.address,
    this.age,
    this.orgId,
    this.walletPrice,
    this.gender,         // ✅ Added to constructor
  });

  @override
  String toString() {
    return 'Member(id: $id, name: $name, contactNo: $contactNo, email: $email, dob: $dob, address: $address, age: $age, orgId: $orgId, walletPrice: $walletPrice, gender: $gender)';
  }

  // ✅ Factory constructor to create a Member from JSON
  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      id: json['id'] as int?,
      name: json['name'] as String?,
      contactNo: json['contact_no'] as String?,
      email: json['email'] as String?,
      dob: json['dob'] as String?,
      address: json['address'] as String?,
      age: json['age'] as int?,
      orgId: json['org_id'] as int?,
      walletPrice: json['wallet_price'] as num?,
      gender: json['gender'] as String?, // ✅ Added to fromJson
    );
  }

  // ✅ Method to convert Member object to JSON
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "contact_no": contactNo,
      "email": email,
      "dob": dob,
      "address": address,
      "age": age,
      "org_id": orgId,
      "wallet_price": walletPrice,
      "gender": gender, // ✅ Added to toJson
    };
  }
}