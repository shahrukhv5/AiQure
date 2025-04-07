class UserModel {
  // Unique user ID
  final int id;
  // User's full name
  final String name;
  // User's email address
  final String email;
  // User's contact number (phone)
  final String contactNo;
  // Member ID (nullable, applicable if the user is a member)
  final String? memberId;
  // Organization ID (nullable, applicable if the user belongs to an organization)
  final int? organizationId;
  // User role type (e.g., "Member" or "Organization")
  final String roleType;
  // Constructor to initialize the UserModel instance
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.contactNo,
    this.memberId,
    this.organizationId,
    required this.roleType, // Ensuring roleType is required and non-nullable
  });
  
  factory UserModel.fromJson(dynamic json) {
    if (json == null) {
      throw Exception("User data is null");
    }

    // ✅ If API returns a list, convert it into a map
    if (json is List<dynamic>) {
      return UserModel(
        id: json[0] ?? 0,
        name: json[1] ?? '',
        email: json[2] ?? '',
        contactNo: json[3] ?? '',
        memberId: json[4]?.toString(),  // Convert int to String if needed
        organizationId: json[5],
        roleType: json[6] ?? '',
      );
    }

    // ✅ If API returns a map, process normally
    return UserModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      contactNo: json['contact_no'] ?? '',
      memberId: json['member_id']?.toString(), // Convert int to String if needed
      organizationId: json['organization_id'],
      roleType: json['roletype'] ?? '',
    );
  }

  // Method to convert UserModel instance into JSON format
  Map<String, dynamic> toJson() {
    return {
      'id': id,                   // Storing user ID
      'name': name,               // Storing user name
      'email': email,             // Storing email address
      'contact_no': contactNo,    // Storing contact number
      'member_id': memberId,      // Storing member ID (nullable)
      'organization_id': organizationId, // Storing organization ID (nullable)
      'roletype': roleType,       // Storing role type
    };
  }
}
