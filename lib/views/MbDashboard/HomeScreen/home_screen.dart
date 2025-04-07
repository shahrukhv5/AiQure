// import 'package:aiqure/models/UserModel/user_model.dart';
// import 'package:aiqure/views/MbDashboard/ProfilePage/profile_page.dart';
// import 'package:flutter/material.dart';
// import '../../../services/api_service.dart';
//
// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   UserModel? user;
//
//   @override
//   void initState() {
//     super.initState();
//     fetchUserData();
//   }
//
//   void fetchUserData() async {
//     UserModel? fetchedUser = await ApiService.getUserSession();
//     setState(() {
//       user = fetchedUser;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(180),
//         child: Container(
//           decoration: BoxDecoration(
//             color: Color(0xFF3661E2),
//             borderRadius: BorderRadius.only(
//               bottomLeft: Radius.circular(30),
//               bottomRight: Radius.circular(30),
//             ),
//           ),
//           child: SafeArea(
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             'Hello 👋',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                           user == null
//                               ? CircularProgressIndicator(color: Colors.white)
//                               : Text(
//                             user!.name!,
//                             style: TextStyle(
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => ProfilePage(),
//                             ),
//                           );
//                         },
//                         child: CircleAvatar(
//                           radius: 24,
//                           backgroundColor: Colors.white,
//                           child: Icon(
//                             Icons.person,
//                             color: Color(0xFF3661E2),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10),
//                   Row(
//                     children: [
//                       Icon(Icons.location_on, color: Colors.white, size: 20),
//                       SizedBox(width: 5),
//                       Expanded(
//                         child: Text(
//                           "Your location",
//                           style: TextStyle(color: Colors.white, fontSize: 14),
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     child: TextField(
//                       decoration: InputDecoration(
//                         prefixIcon: Icon(Icons.search, color: Colors.grey),
//                         hintText: 'Search a doctor, dental issues here...',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10),
//                           borderSide: BorderSide.none,
//                         ),
//                         contentPadding:
//                         EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: CategoryScreen(),
//     );
//   }
// }
import 'package:aiqure/models/UserModel/user_model.dart';
import 'package:aiqure/views/MbDashboard/ProfilePage/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_initicon/flutter_initicon.dart';
import 'package:torn_ticket/torn_ticket.dart';
import '../../../services/api_service.dart';
import '../PackageBookingConfirmation/package_booking_confirmation.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserModel? user;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  void fetchUserData() async {
    UserModel? fetchedUser = await ApiService.getUserSession();
    setState(() {
      user = fetchedUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(180),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF3661E2),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello 👋',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          user == null
                              ? CircularProgressIndicator(color: Colors.white)
                              : Text(
                                user!.name!,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfilePage(),
                            ),
                          );
                        },
                        child:
                            user == null
                                ? CircleAvatar(
                                  radius: 24,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.person,
                                    color: Color(0xFF3661E2),
                                  ),
                                )
                                : Initicon(
                                  text: user!.name!,
                                  size: 48, // 24 radius * 2 = 48 diameter
                                  backgroundColor: Colors.white,
                                  elevation: 4,
                                  style: TextStyle(
                                    color: Color(0xFF3661E2),
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.white, size: 20),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          "Your location",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        hintText: 'Search a doctor, dental issues here...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: CategoryScreen(),
    );
  }
}

class CategoryScreen extends StatelessWidget {
  // Constants for consistent styling
  static const _primaryColor = Color(0xFF3661E2);
  static const _categoryTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
  static const _sectionTitleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Color(0xFF3661E2),
  );

  final List<Map<String, dynamic>> categories = [
    {
      "title": "Pharmacies",
      "color": Colors.indigo,
      "icon": Icons.local_pharmacy,
    },
    {
      "title": "Lab Tests",
      "color": Colors.deepPurpleAccent,
      "icon": Icons.biotech,
    },
    {
      "title": "Clinical",
      "color": Colors.pink,
      "icon": Icons.health_and_safety,
    },
    {"title": "Cardiology", "color": Colors.redAccent, "icon": Icons.favorite},
    {"title": "Dermatology", "color": Colors.cyan, "icon": Icons.spa},
    {
      "title": "General Medicine",
      "color": Colors.amber,
      "icon": Icons.medical_services,
    },
  ];

  final List<Map<String, dynamic>> nearbyClinics = [
    {
      "title": "City Medical Center",
      "details": "Open 24/7 • \$50 Consultation Fee",
      "rating": 4.8,
      "distance": "1.2 km away",
      "specialties": ["Emergency", "General Medicine", "Pediatrics"],
      "waitTime": "15 min avg wait",
    },
    {
      "title": "Community Health Clinic",
      "details": "8AM-8PM • \$30 Consultation Fee",
      "rating": 4.5,
      "distance": "0.8 km away",
      "specialties": ["Family Medicine", "Vaccinations"],
      "waitTime": "30 min avg wait",
    },
    {
      "title": "Advanced Cardiology Institute",
      "details": "By Appointment • \$120 Specialist Fee",
      "rating": 4.9,
      "distance": "2.5 km away",
      "specialties": ["Cardiac Testing", "EKG", "Echocardiogram"],
      "waitTime": "1-2 days for appointment",
    },
    {
      "title": "Bright Smile Dental",
      "details": "9AM-6PM • \$80 Cleaning",
      "rating": 4.7,
      "distance": "1.8 km away",
      "specialties": ["Cleaning", "Implants", "Braces"],
      "waitTime": "Same-day appointments",
    },
  ];

  CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCategoriesSection(context),
            _buildNearbyServicesSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriesSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Medical Categories",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3661E2),
            ),
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.6,
            ),
            itemBuilder: (context, index) {
              return _buildCategoryCard(context, categories[index]);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context,
    Map<String, dynamic> category,
  ) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => PackagesScreen
                  // TicketExampleScreen
                  (
                    categoryTitle: category["title"],
                    categoryColor: category["color"],
                  ),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: category["color"],
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                (category["color"] as Color).withOpacity(0.9),
                (category["color"] as Color).withOpacity(0.7),
              ],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: -10,
                left: -10,
                child: Icon(
                  category["icon"],
                  size: 80,
                  color: Colors.white.withOpacity(0.15),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    category["title"],
                    textAlign: TextAlign.center,
                    style: _categoryTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNearbyServicesSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Nearby Services", style: _sectionTitleStyle),
          const SizedBox(height: 12),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: nearbyClinics.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return _buildClinicCard(nearbyClinics[index]);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildClinicCard(Map<String, dynamic> clinic) {
    return Material(
      borderRadius: BorderRadius.circular(16),
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.1),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          // Handle clinic tap
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.withOpacity(0.1), width: 3),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      clinic["title"],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  _buildRatingBadge(clinic["rating"]),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 16,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 4),
                  Text(
                    clinic["distance"],
                    style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  ),
                  const Spacer(),
                  Icon(Icons.access_time, size: 16, color: _primaryColor),
                  const SizedBox(width: 4),
                  Text(
                    clinic["waitTime"],
                    style: TextStyle(
                      fontSize: 13,
                      color: _primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                clinic["details"],
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[800],
                  height: 1.4,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              if (clinic["specialties"] != null &&
                  (clinic["specialties"] as List).isNotEmpty) ...[
                const SizedBox(height: 12),
                _buildSpecialtiesRow(clinic["specialties"] as List<String>),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRatingBadge(double rating) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, size: 16, color: _primaryColor),
          const SizedBox(width: 4),
          Text(
            rating.toStringAsFixed(1),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: _primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecialtiesRow(List<String> specialties) {
    return Wrap(
      spacing: 8,
      runSpacing: 6,
      children:
          specialties.map((specialty) {
            return Chip(
              label: Text(
                specialty,
                style: const TextStyle(fontSize: 11, color: _primaryColor),
              ),
              backgroundColor: _primaryColor.withOpacity(0.1),
              visualDensity: VisualDensity.compact,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            );
          }).toList(),
    );
  }
}

class TicketExampleScreen extends StatelessWidget {
  const TicketExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: const Text(
          'TORN TICKET EXAMPLES',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header('Grid Example'),
              const SizedBox(height: 10),
              _buildGridExample(),
              const SizedBox(height: 20),
              _header('List Example'),
              const SizedBox(height: 10),
              _buildListExample(),
              _header('Single Ticket Example'),
              const SizedBox(height: 10),
              _buildSingleTicketExample(),
            ],
          ),
        ),
      ),
    );
  }

  Text _header(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildGridExample() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: 4,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return TornTicket(
          elevation: 5,
          shadowColor: Colors.black,
          shadowOffset: const Offset(0, 0.8),
          margin: EdgeInsets.zero,
          child: Center(child: Text('Coupon #${index + 1}')),
        );
      },
    );
  }

  Widget _buildListExample() {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TornTicket(
            borderRadius: 15.0,
            cutoutRadius: 10.0,
            cutoutHeight: 15.0,
            cutoutPosition: 0.4,
            bottomEndSpacing: 5.0,
            bottomArcSpacing: 10.0,
            elevation: 5.0,
            shadowColor: Colors.black,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(child: Text('Ticket #${index + 1}')),
          ),
        );
      },
    );
  }

  Widget _buildSingleTicketExample() {
    return const Center(
      child: TornTicket(
        borderRadius: 15.0,
        cutoutRadius: 10.0,
        cutoutHeight: 15.0,
        cutoutPosition: 0.4,
        bottomEndSpacing: 5.0,
        bottomArcSpacing: 10.0,
        elevation: 5.0,
        hasShadow: true,
        shadowColor: Colors.black,
        margin: EdgeInsets.symmetric(horizontal: 10),
        shadowOffset: Offset(5, 2),
        child: Center(child: Text('Ticket #1')),
      ),
    );
  }
}
// class Ticket extends StatelessWidget {
//   const Ticket({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       appBar: AppBar(
//         title: Text("Ticket Screen"),
//       ),
//       body: Center(
//               child: TornTicket(
//                 child: Center(
//                   child: Text("hello"),
//                 ),
//               ),
//       ),
//     );
//   }
// }

// class PackagesScreen extends StatelessWidget {
//   final String categoryTitle;
//   final Color categoryColor;
//
//   final Map<String, List<Map<String, dynamic>>> categoryPackages = {
//     "Pharmacies": [
//       {
//         "name": "Basic Medicine Package",
//         "provider": "City Pharmacy",
//         "price": "\$25",
//         "originalPrice": "\$35",
//         "discount": "30% OFF",
//         "includes": ["Pain relievers", "Antacids", "Bandages"],
//         "offerValidUntil": "Offer valid until Dec 31, 2023",
//         "isPopular": false,
//       },
//       {
//         "name": "First Aid Kit",
//         "provider": "HealthPlus Pharmacy",
//         "price": "\$45",
//         "includes": ["Bandages", "Antiseptics", "Thermometer"],
//         "isPopular": true,
//       },
//       {
//         "name": "Travel Health Kit",
//         "provider": "Global Meds",
//         "price": "\$65",
//         "originalPrice": "\$80",
//         "discount": "20% OFF",
//         "includes": ["Motion sickness pills", "Antidiarrheal", "Sanitizers"],
//         "offerValidUntil": "Limited time offer",
//         "isPopular": false,
//       },
//     ],
//     "Lab Tests": [
//       {
//         "name": "Basic Health Checkup",
//         "provider": "Diagno Labs",
//         "price": "\$99",
//         "originalPrice": "\$120",
//         "discount": "18% OFF",
//         "includes": ["CBC", "Blood Sugar", "Cholesterol"],
//         "offerValidUntil": "New Year special",
//         "isPopular": true,
//       },
//       {
//         "name": "Diabetes Panel",
//         "provider": "MediTest Laboratories",
//         "price": "\$120",
//         "includes": ["Fasting Glucose", "HbA1c", "Insulin"],
//         "isPopular": false,
//       },
//       {
//         "name": "Thyroid Profile",
//         "provider": "Diagno Labs",
//         "price": "\$85",
//         "originalPrice": "\$100",
//         "discount": "15% OFF",
//         "includes": ["TSH", "T3", "T4"],
//         "offerValidUntil": "Seasonal offer",
//         "isPopular": false,
//       },
//       {
//         "name": "Complete Metabolic Panel",
//         "provider": "Advanced Pathology",
//         "price": "\$150",
//         "includes": ["Liver function", "Kidney function", "Electrolytes"],
//         "isPopular": true,
//       },
//     ],
//     "Clinical": [
//       {
//         "name": "General Consultation",
//         "provider": "City Medical Center",
//         "price": "\$50",
//         "originalPrice": "\$70",
//         "discount": "29% OFF",
//         "includes": ["Doctor visit", "Basic examination"],
//         "offerValidUntil": "Weekend special",
//         "isPopular": false,
//       },
//       {
//         "name": "Pediatric Checkup",
//         "provider": "Children's Health Clinic",
//         "price": "\$60",
//         "includes": ["Child examination", "Growth tracking"],
//         "isPopular": true,
//       },
//       {
//         "name": "Senior Health Package",
//         "provider": "Golden Years Medical",
//         "price": "\$90",
//         "originalPrice": "\$110",
//         "discount": "18% OFF",
//         "includes": ["Comprehensive checkup", "Medication review"],
//         "offerValidUntil": "Senior citizen offer",
//         "isPopular": false,
//       },
//     ],
//     "Cardiology": [
//       {
//         "name": "Basic Heart Check",
//         "provider": "Heart Care Specialists",
//         "price": "\$150",
//         "includes": ["ECG", "Blood Pressure", "Cholesterol"],
//         "isPopular": false,
//       },
//       {
//         "name": "Advanced Cardiac Package",
//         "provider": "CardioVascular Institute",
//         "price": "\$250",
//         "originalPrice": "\$300",
//         "discount": "17% OFF",
//         "includes": ["Stress Test", "Echocardiogram", "Consultation"],
//         "offerValidUntil": "Heart month special",
//         "isPopular": true,
//       },
//     ],
//     "Dermatology": [
//       {
//         "name": "Skin Checkup",
//         "provider": "Skin Health Clinic",
//         "price": "\$80",
//         "originalPrice": "\$100",
//         "discount": "20% OFF",
//         "includes": ["Full body exam", "Mole mapping"],
//         "offerValidUntil": "Summer special",
//         "isPopular": true,
//       },
//       {
//         "name": "Acne Treatment Package",
//         "provider": "DermaCare Solutions",
//         "price": "\$120",
//         "includes": ["Consultation", "Topical treatments"],
//         "isPopular": false,
//       },
//     ],
//     "General Medicine": [
//       {
//         "name": "Annual Physical",
//         "provider": "Family Health Practice",
//         "price": "\$100",
//         "originalPrice": "\$130",
//         "discount": "23% OFF",
//         "includes": ["Full examination", "Lab tests"],
//         "offerValidUntil": "Year-end special",
//         "isPopular": true,
//       },
//       {
//         "name": "Flu Vaccination Package",
//         "provider": "Community Health Center",
//         "price": "\$40",
//         "includes": ["Vaccine", "Doctor consultation"],
//         "isPopular": false,
//       },
//     ],
//   };
//   PackagesScreen({
//     super.key,
//     required this.categoryTitle,
//     required this.categoryColor,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final packages = categoryPackages[categoryTitle] ?? [];
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(categoryTitle),
//         backgroundColor: categoryColor,
//       ),
//       body: packages.isEmpty
//           ? const Center(child: Text("No packages available"))
//           : ListView.builder(
//         padding: const EdgeInsets.all(16),
//         itemCount: packages.length,
//         itemBuilder: (context, index) {
//           return _buildPackageCard(context, packages[index]);
//         },
//       ),
//     );
//   }
//
//   Widget _buildPackageCard(BuildContext context, Map<String, dynamic> package) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 16),
//       elevation: 3,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Stack(
//         children: [
//           if (package["isPopular"] ?? false)
//             Positioned(
//               top: 0,
//               right: 0,
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                 decoration: const BoxDecoration(
//                   color: Colors.amber,
//                   borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(12),
//                     bottomLeft: Radius.circular(12),
//                   ),
//                 ),
//                 child: const Text(
//                   "POPULAR",
//                   style: TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   package["name"],
//                   style: const TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Row(
//                   children: [
//                     const Icon(Icons.business, size: 16, color: Colors.grey),
//                     const SizedBox(width: 4),
//                     Text(
//                       package["provider"] ?? "Provider not specified",
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.grey[600],
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 8),
//
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       package["price"],
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: categoryColor,
//                       ),
//                     ),
//                     if (package["discount"] != null)
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 8,
//                           vertical: 4,
//                         ),
//                         decoration: BoxDecoration(
//                           color: Colors.red.withOpacity(0.2),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Text(
//                           package["discount"],
//                           style: const TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.red,
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//
//                 if (package["originalPrice"] != null)
//                   Padding(
//                     padding: const EdgeInsets.only(top: 4),
//                     child: Text(
//                       "Was ${package["originalPrice"]}",
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.grey[600],
//                         decoration: TextDecoration.lineThrough,
//                       ),
//                     ),
//                   ),
//
//                 const SizedBox(height: 12),
//                 const Text(
//                   "Includes:",
//                   style: TextStyle(fontWeight: FontWeight.w500),
//                 ),
//                 const SizedBox(height: 8),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: (package["includes"] as List<String>)
//                       .map(
//                         (item) => Padding(
//                       padding: const EdgeInsets.only(bottom: 4),
//                       child: Row(
//                         children: [
//                           Icon(
//                             Icons.check_circle,
//                             size: 16,
//                             color: categoryColor,
//                           ),
//                           const SizedBox(width: 8),
//                           Text(item),
//                         ],
//                       ),
//                     ),
//                   )
//                       .toList(),
//                 ),
//
//                 if (package["offerValidUntil"] != null)
//                   Padding(
//                     padding: const EdgeInsets.only(top: 8),
//                     child: Row(
//                       children: [
//                         Icon(
//                           Icons.access_time,
//                           size: 16,
//                           color: Colors.green[700],
//                         ),
//                         const SizedBox(width: 4),
//                         Text(
//                           package["offerValidUntil"],
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.green[700],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                 const SizedBox(height: 12),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: categoryColor,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => PackageBookingConfirmation(
//                             package: package,
//                           ),
//                         ),
//                       );
//                     },
//                     child: const Text(
//                       "Book Package",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
class PackagesScreen extends StatelessWidget {
  final String categoryTitle;
  final Color categoryColor;

  final Map<String, List<Map<String, dynamic>>> categoryPackages = {
    "Pharmacies": [
      {
        "provider": "City Pharmacy",
        "location": "123 Main St, Downtown",
        "service": "Basic Medicine Package",
        "offer": "30% OFF",
      },
      {
        "provider": "HealthPlus Pharmacy",
        "location": "456 Oak Ave, Midtown",
        "service": "First Aid Kit",
        "offer": "Free delivery",
      },
      {
        "provider": "Global Meds",
        "location": "789 Travel Plaza",
        "service": "Travel Health Kit",
        "offer": "20% OFF",
      },
    ],
    "Lab Tests": [
      {
        "provider": "Diagno Labs",
        "location": "101 Medical Center",
        "service": "Basic Health Checkup",
        "offer": "18% OFF",
      },
      {
        "provider": "MediTest Laboratories",
        "location": "202 Science Park",
        "service": "Diabetes Panel",
        "offer": "Free consultation",
      },
      {
        "provider": "Diagno Labs",
        "location": "101 Medical Center",
        "service": "Thyroid Profile",
        "offer": "15% OFF",
      },
      {
        "provider": "Advanced Pathology",
        "location": "303 Health Campus",
        "service": "Complete Metabolic Panel",
        "offer": "Priority results",
      },
    ],
    "Clinical": [
      {
        "provider": "City Medical Center",
        "location": "404 Clinic Row",
        "service": "General Consultation",
        "offer": "29% OFF",
      },
      {
        "provider": "Children's Health Clinic",
        "location": "505 Pediatric Lane",
        "service": "Pediatric Checkup",
        "offer": "Free growth chart",
      },
      {
        "provider": "Golden Years Medical",
        "location": "606 Senior Plaza",
        "service": "Senior Health Package",
        "offer": "18% OFF",
      },
    ],
    "Cardiology": [
      {
        "provider": "Heart Care Specialists",
        "location": "707 Cardiac Center",
        "service": "Basic Heart Check",
        "offer": "Free ECG",
      },
      {
        "provider": "CardioVascular Institute",
        "location": "808 Heart Hospital",
        "service": "Advanced Cardiac Package",
        "offer": "17% OFF",
      },
    ],
    "Dermatology": [
      {
        "provider": "Skin Health Clinic",
        "location": "909 Dermatology Center",
        "service": "Skin Checkup",
        "offer": "20% OFF",
      },
      {
        "provider": "DermaCare Solutions",
        "location": "1010 Beauty Plaza",
        "service": "Acne Treatment Package",
        "offer": "Free follow-up",
      },
    ],
    "General Medicine": [
      {
        "provider": "Family Health Practice",
        "location": "1111 Wellness Blvd",
        "service": "Annual Physical",
        "offer": "23% OFF",
      },
      {
        "provider": "Community Health Center",
        "location": "1212 Public Health Ave",
        "service": "Flu Vaccination Package",
        "offer": "Free health screening",
      },
    ],
  };

  PackagesScreen({
    super.key,
    required this.categoryTitle,
    required this.categoryColor,
  });

  @override
  Widget build(BuildContext context) {
    final packages = categoryPackages[categoryTitle] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: categoryColor,
      ),
      body: packages.isEmpty
          ? const Center(child: Text("No packages available"))
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: packages.length,
        itemBuilder: (context, index) {
          return _buildPackageCard(context, packages[index]);
        },
      ),
    );
  }

  Widget _buildPackageCard(BuildContext context, Map<String, dynamic> package) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Service Provider Name
            Text(
              package["provider"] ?? "Provider not specified",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            // Location
            Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(
                  package["location"] ?? "Location not specified",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Service Provided
            Text(
              "Service: ${package["service"] ?? "Service not specified"}",
              style: const TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 12),

            // Offer
            if (package["offer"] != null)
              Row(
                children: [
                  const Icon(Icons.local_offer, size: 16, color: Colors.orange),
                  const SizedBox(width: 4),
                  Text(
                    "Offer: ${package["offer"]}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),

            const SizedBox(height: 16),

            // Book Package Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: categoryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PackageBookingConfirmation(
                        package: package,
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Book Package",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class PackagesScreen extends StatelessWidget {
//   final String categoryTitle;
//   final Color categoryColor;
//
//   final Map<String, List<Map<String, dynamic>>> categoryPackages = {
//     "Pharmacies": [
//       {
//         "name": "Basic Medicine Package",
//         "price": "\$25",
//         "originalPrice": "\$35",
//         "discount": "30% OFF",
//         "includes": ["Pain relievers", "Antacids", "Bandages"],
//         "offerValidUntil": "Offer valid until Dec 31, 2023",
//         "isPopular": false
//       },
//       {
//         "name": "First Aid Kit",
//         "price": "\$45",
//         "includes": ["Bandages", "Antiseptics", "Thermometer"],
//         "isPopular": true
//       },
//       {
//         "name": "Travel Health Kit",
//         "price": "\$65",
//         "originalPrice": "\$80",
//         "discount": "20% OFF",
//         "includes": ["Motion sickness pills", "Antidiarrheal", "Sanitizers"],
//         "offerValidUntil": "Limited time offer",
//         "isPopular": false
//       },
//     ],
//     "Lab Tests": [
//       {
//         "name": "Basic Health Checkup",
//         "price": "\$99",
//         "originalPrice": "\$120",
//         "discount": "18% OFF",
//         "includes": ["CBC", "Blood Sugar", "Cholesterol"],
//         "offerValidUntil": "New Year special",
//         "isPopular": true
//       },
//       {
//         "name": "Diabetes Panel",
//         "price": "\$120",
//         "includes": ["Fasting Glucose", "HbA1c", "Insulin"],
//         "isPopular": false
//       },
//       {
//         "name": "Thyroid Profile",
//         "price": "\$85",
//         "originalPrice": "\$100",
//         "discount": "15% OFF",
//         "includes": ["TSH", "T3", "T4"],
//         "offerValidUntil": "Seasonal offer",
//         "isPopular": false
//       },
//       {
//         "name": "Complete Metabolic Panel",
//         "price": "\$150",
//         "includes": ["Liver function", "Kidney function", "Electrolytes"],
//         "isPopular": true
//       },
//     ],
//     "Clinical": [
//       {
//         "name": "General Consultation",
//         "price": "\$50",
//         "originalPrice": "\$70",
//         "discount": "29% OFF",
//         "includes": ["Doctor visit", "Basic examination"],
//         "offerValidUntil": "Weekend special",
//         "isPopular": false
//       },
//       {
//         "name": "Pediatric Checkup",
//         "price": "\$60",
//         "includes": ["Child examination", "Growth tracking"],
//         "isPopular": true
//       },
//       {
//         "name": "Senior Health Package",
//         "price": "\$90",
//         "originalPrice": "\$110",
//         "discount": "18% OFF",
//         "includes": ["Comprehensive checkup", "Medication review"],
//         "offerValidUntil": "Senior citizen offer",
//         "isPopular": false
//       },
//     ],
//     "Cardiology": [
//       {
//         "name": "Basic Heart Check",
//         "price": "\$150",
//         "includes": ["ECG", "Blood Pressure", "Cholesterol"],
//         "isPopular": false
//       },
//       {
//         "name": "Advanced Cardiac Package",
//         "price": "\$250",
//         "originalPrice": "\$300",
//         "discount": "17% OFF",
//         "includes": ["Stress Test", "Echocardiogram", "Consultation"],
//         "offerValidUntil": "Heart month special",
//         "isPopular": true
//       },
//     ],
//     "Dermatology": [
//       {
//         "name": "Skin Checkup",
//         "price": "\$80",
//         "originalPrice": "\$100",
//         "discount": "20% OFF",
//         "includes": ["Full body exam", "Mole mapping"],
//         "offerValidUntil": "Summer special",
//         "isPopular": true
//       },
//       {
//         "name": "Acne Treatment Package",
//         "price": "\$120",
//         "includes": ["Consultation", "Topical treatments"],
//         "isPopular": false
//       },
//     ],
//     "General Medicine": [
//       {
//         "name": "Annual Physical",
//         "price": "\$100",
//         "originalPrice": "\$130",
//         "discount": "23% OFF",
//         "includes": ["Full examination", "Lab tests"],
//         "offerValidUntil": "Year-end special",
//         "isPopular": true
//       },
//       {
//         "name": "Flu Vaccination Package",
//         "price": "\$40",
//         "includes": ["Vaccine", "Doctor consultation"],
//         "isPopular": false
//       },
//     ],
//   };
//   PackagesScreen({
//     super.key,
//     required this.categoryTitle,
//     required this.categoryColor,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final packages = categoryPackages[categoryTitle] ?? [];
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(categoryTitle),
//         backgroundColor: categoryColor,
//       ),
//       body: packages.isEmpty
//           ? const Center(child: Text("No packages available"))
//           : ListView.builder(
//         padding: const EdgeInsets.all(16),
//         itemCount: packages.length,
//         itemBuilder: (context, index) {
//           return _buildPackageCard(packages[index]);
//         },
//       ),
//     );
//   }
//
//   Widget _buildPackageCard(Map<String, dynamic> package) {
//     return Card(
//       margin: const EdgeInsets.only(bottom: 16),
//       elevation: 3,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Stack(
//         children: [
//           // Popular badge
//           if (package["isPopular"] ?? false)
//             Positioned(
//               top: 0,
//               right: 0,
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                 decoration: BoxDecoration(
//                   color: Colors.amber,
//                   borderRadius: const BorderRadius.only(
//                     topRight: Radius.circular(12),
//                     bottomLeft: Radius.circular(12),
//                   ),
//                 ),
//                 child: const Text(
//                   "POPULAR",
//                   style: TextStyle(
//                     fontSize: 12,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: Text(
//                         package["name"],
//                         style: const TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     // Discount badge if available
//                     if (package["discount"] != null)
//                       Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                         decoration: BoxDecoration(
//                           color: Colors.red.withOpacity(0.2),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Text(
//                           package["discount"],
//                           style: const TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.red,
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//
//                 // Original price if discounted
//                 if (package["originalPrice"] != null)
//                   Padding(
//                     padding: const EdgeInsets.only(top: 4),
//                     child: Text(
//                       "Was ${package["originalPrice"]}",
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: Colors.grey[600],
//                         decoration: TextDecoration.lineThrough,
//                       ),
//                     ),
//                   ),
//
//                 const SizedBox(height: 12),
//                 const Text(
//                   "Includes:",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: (package["includes"] as List<String>)
//                       .map((item) => Padding(
//                     padding: const EdgeInsets.only(bottom: 4),
//                     child: Row(
//                       children: [
//                         Icon(
//                           Icons.check_circle,
//                           size: 16,
//                           color: categoryColor,
//                         ),
//                         const SizedBox(width: 8),
//                         Text(item),
//                       ],
//                     ),
//                   ))
//                       .toList(),
//                 ),
//
//                 // Offer validity if available
//                 if (package["offerValidUntil"] != null)
//                   Padding(
//                     padding: const EdgeInsets.only(top: 8),
//                     child: Row(
//                       children: [
//                         Icon(
//                           Icons.access_time,
//                           size: 16,
//                           color: Colors.green[700],
//                         ),
//                         const SizedBox(width: 4),
//                         Text(
//                           package["offerValidUntil"],
//                           style: TextStyle(
//                             fontSize: 12,
//                             color: Colors.green[700],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//
//                 const SizedBox(height: 12),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: categoryColor,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     onPressed: () {
//                       // Handle package booking
//                     },
//                     child: const Text(
//                       "Book Package",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// class CategoryScreen extends StatelessWidget {
//   // Constants for consistent styling
//   static const _primaryColor = Color(0xFF3661E2);
//   static const _categoryTextStyle = TextStyle(
//     color: Colors.white,
//     fontSize: 16,
//     fontWeight: FontWeight.bold,
//   );
//   static const _sectionTitleStyle = TextStyle(
//     fontSize: 18,
//     fontWeight: FontWeight.bold,
//     color: Color(0xFF3661E2),
//   );
//   static const _clinicTitleStyle = TextStyle(
//     fontSize: 16,
//     fontWeight: FontWeight.bold,
//     color: Color(0xFF3661E2),
//   );
//
//   final List<Map<String, dynamic>> categories = [
//     {"title": "Pharmacies", "color": Colors.indigo, "icon": Icons.local_pharmacy},
//     {"title": "Lab Tests", "color": Colors.deepPurpleAccent, "icon": Icons.biotech},
//     {"title": "Clinical", "color": Colors.pink, "icon": Icons.health_and_safety},
//     {"title": "Cardiology", "color": Colors.redAccent, "icon": Icons.favorite},
//     {"title": "Dermatology", "color": Colors.cyan, "icon": Icons.spa},
//     {"title": "General Medicine", "color": Colors.amber, "icon": Icons.medical_services},
//   ];
//
//   final List<Map<String, dynamic>> nearbyClinics = [
//     {
//       "title": "City Medical Center",
//       "details": "Open 24/7 • \$50 Consultation Fee",
//       "rating": 4.8,
//       "distance": "1.2 km away",
//       "specialties": ["Emergency", "General Medicine", "Pediatrics"],
//       "waitTime": "15 min avg wait"
//     },
//     {
//       "title": "Community Health Clinic",
//       "details": "8AM-8PM • \$30 Consultation Fee",
//       "rating": 4.5,
//       "distance": "0.8 km away",
//       "specialties": ["Family Medicine", "Vaccinations"],
//       "waitTime": "30 min avg wait"
//     },
//     {
//       "title": "Advanced Cardiology Institute",
//       "details": "By Appointment • \$120 Specialist Fee",
//       "rating": 4.9,
//       "distance": "2.5 km away",
//       "specialties": ["Cardiac Testing", "EKG", "Echocardiogram"],
//       "waitTime": "1-2 days for appointment"
//     },
//     {
//       "title": "Bright Smile Dental",
//       "details": "9AM-6PM • \$80 Cleaning",
//       "rating": 4.7,
//       "distance": "1.8 km away",
//       "specialties": ["Cleaning", "Implants", "Braces"],
//       "waitTime": "Same-day appointments"
//     },
//   ];
//
//     CategoryScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Categories Section
//             _buildCategoriesSection(),
//
//             // Nearby Services Section
//             _buildNearbyServicesSection(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildCategoriesSection() {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             "Medical Categories",
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: Color(0xFF3661E2),
//             ),
//           ),
//           const SizedBox(height: 12),
//           GridView.builder(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: categories.length,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               crossAxisSpacing: 16,
//               mainAxisSpacing: 16,
//               childAspectRatio: 1.6,
//             ),
//             itemBuilder: (context, index) {
//               return _buildCategoryCard(categories[index]);
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildCategoryCard(Map<String, dynamic> category) {
//     return Material(
//       borderRadius: BorderRadius.circular(12),
//       elevation: 2,
//       child: InkWell(
//         borderRadius: BorderRadius.circular(12),
//         onTap: () {
//           // Handle category tap
//         },
//         child: Container(
//           decoration: BoxDecoration(
//             color: category["color"],
//             borderRadius: BorderRadius.circular(12),
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [
//                 (category["color"] as Color).withOpacity(0.9),
//                 (category["color"] as Color).withOpacity(0.7),
//               ],
//             ),
//           ),
//           child: Stack(
//             children: [
//               Positioned(
//                 top: -10,
//                 left: -10,
//                 child: Icon(
//                   category["icon"],
//                   size: 80,
//                   color: Colors.white.withOpacity(0.15),
//                 ),
//               ),
//               Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     category["title"],
//                     textAlign: TextAlign.center,
//                     style: _categoryTextStyle,
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
//   Widget _buildNearbyServicesSection() {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Nearby Services",
//             style: _sectionTitleStyle,
//           ),
//           const SizedBox(height: 12),
//           ListView.separated(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             itemCount: nearbyClinics.length,
//             separatorBuilder: (context, index) => const SizedBox(height: 12),
//             itemBuilder: (context, index) {
//               return _buildClinicCard(nearbyClinics[index]);
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildClinicCard(Map<String, dynamic> clinic) {
//     return Material(
//       borderRadius: BorderRadius.circular(16),
//       elevation: 2,
//       shadowColor: Colors.black.withOpacity(0.1),
//       child: InkWell(
//         borderRadius: BorderRadius.circular(16),
//         onTap: () {
//           // Handle clinic tap
//         },
//         child: Container(
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(16),
//             border: Border.all(
//               color: Colors.grey.withOpacity(0.1),
//               width: 3,
//             ),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Text(
//                       clinic["title"],
//                       style: const TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.black87,
//                       ),
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                   _buildRatingBadge(clinic["rating"]),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               Row(
//                 children: [
//                   Icon(Icons.location_on_outlined,
//                       size: 16,
//                       color: Colors.grey[600]),
//                   const SizedBox(width: 4),
//                   Text(
//                     clinic["distance"],
//                     style: TextStyle(
//                       fontSize: 13,
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                   const Spacer(),
//                   Icon(Icons.access_time,
//                       size: 16,
//                       color: _primaryColor),
//                   const SizedBox(width: 4),
//                   Text(
//                     clinic["waitTime"],
//                     style: TextStyle(
//                       fontSize: 13,
//                       color: _primaryColor,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 12),
//               Text(
//                 clinic["details"],
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.grey[800],
//                   height: 1.4,
//                 ),
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//               if (clinic["specialties"] != null &&
//                   (clinic["specialties"] as List).isNotEmpty) ...[
//                 const SizedBox(height: 12),
//                 _buildSpecialtiesRow(clinic["specialties"] as List<String>),
//               ],
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   Widget _buildRatingBadge(double rating) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//       decoration: BoxDecoration(
//         color: _primaryColor.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(Icons.star,
//               size: 16,
//               color: _primaryColor),
//           const SizedBox(width: 4),
//           Text(
//             rating.toStringAsFixed(1),
//             style: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.bold,
//               color: _primaryColor,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//   Widget _buildSpecialtiesRow(List<String> specialties) {
//     return Wrap(
//       spacing: 8,
//       runSpacing: 6,
//       children: specialties.map((specialty) {
//         return Chip(
//           label: Text(
//             specialty,
//             style: const TextStyle(fontSize: 11, color: _primaryColor),
//           ),
//           backgroundColor: _primaryColor.withOpacity(0.1),
//           visualDensity: VisualDensity.compact,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(6),
//           ),
//         );
//       }).toList(),
//     );
//   }
// }
// class CategoryScreen extends StatelessWidget {
//   final List<Map<String, dynamic>> categories = [
//     {"title": "Doctors", "icon": Icons.medical_services, "color": Color(0xFFE3F2FD)},
//     {"title": "Hospitals", "icon": Icons.local_hospital, "color": Color(0xFFE8F5E9)},
//     {"title": "Pharmacies", "icon": Icons.local_pharmacy, "color": Color(0xFFFFF8E1)},
//     {"title": "Lab Tests", "icon": Icons.science, "color": Color(0xFFFCE4EC)},
//     {"title": "Emergency", "icon": Icons.emergency, "color": Color(0xFFE0F7FA)},
//     // {"title": "Specialists", "icon": Icons.health_and_safety, "color": Color(0xFFEDE7F6)},
//     // {"title": "Telemedicine", "icon": Icons.video_call, "color": Color(0xFFE8F5E9)},
//     // {"title": "Wellness", "icon": Icons.self_improvement, "color": Color(0xFFFFF3E0)},
//     // {"title": "Appointments", "icon": Icons.calendar_today, "color": Color(0xFFF3E5F5)},
//     // {"title": "View All>", "icon": Icons.chevron_right, "color": Color(0xFFEEEEEE)},
//   ];
//
//   final List<Map<String, String>> healthServices = [
//     {"title": "Cardiology", "icon": "assets/healthServices/heart.png"},
//     // {"title": "Dermatology", "icon": "assets/skin.png"},
//     // {"title": "Pediatrics", "icon": "assets/child.png"},
//     {"title": "Orthopedics", "icon": "assets/healthServices/bone.png"},
//     {"title": "Dentistry", "icon": "assets/healthServices/tooth.png"},
//     {"title": "Neurology", "icon": "assets/healthServices/brain.png"},
//   ];
//
//   // final List<Map<String, dynamic>> nearbyClinics = [
//   //   {
//   //     "title": "City Medical Center",
//   //     "details": "Open 24/7 - \$50 Consultation Fee",
//   //     "rating": 4.8,
//   //     "image": "assets/hospital1.png",
//   //     "distance": "1.2 km away"
//   //   },
//   //   {
//   //     "title": "Community Health Clinic",
//   //     "details": "8AM-8PM - \$30 Consultation Fee",
//   //     "rating": 4.5,
//   //     "image": "assets/hospital2.png",
//   //     "distance": "0.8 km away"
//   //   },
//   // ];
//   final List<Map<String, dynamic>> nearbyClinics = [
//     {
//       "title": "City Medical Center",
//       "details": "Open 24/7 • \$50 Consultation Fee",
//       "rating": 4.8,
//       "image": "assets/hospitals/hospital1.jpg",
//       "distance": "1.2 km away",
//       "specialties": ["Emergency", "General Medicine", "Pediatrics"],
//       "waitTime": "15 min avg wait"
//     },
//     {
//       "title": "Community Health Clinic",
//       "details": "8AM-8PM • \$30 Consultation Fee",
//       "rating": 4.5,
//       "image": "assets/hospitals/hospital2.jpg",
//       "distance": "0.8 km away",
//       "specialties": ["Family Medicine", "Vaccinations"],
//       "waitTime": "30 min avg wait"
//     },
//     {
//       "title": "Advanced Cardiology Institute",
//       "details": "By Appointment • \$120 Specialist Fee",
//       "rating": 4.9,
//       "image": "assets/hospitals/hospital3.jpg",
//       "distance": "2.5 km away",
//       "specialties": ["Cardiac Testing", "EKG", "Echocardiogram"],
//       "waitTime": "1-2 days for appointment"
//     },
//     {
//       "title": "Bright Smile Dental",
//       "details": "9AM-6PM • \$80 Cleaning",
//       "rating": 4.7,
//       "image": "assets/hospitals/hospital4.jpg",
//       "distance": "1.8 km away",
//       "specialties": ["Cleaning", "Implants", "Braces"],
//       "waitTime": "Same-day appointments"
//     },
//     // {
//     //   "title": "NeuroCare Center",
//     //   "details": "Mon-Fri 9AM-5PM • \$150 Specialist Fee",
//     //   "rating": 4.6,
//     //   "image": "assets/neuro.png",
//     //   "distance": "3.1 km away",
//     //   "specialties": ["Neurology", "Sleep Studies"],
//     //   "waitTime": "1 week for new patients"
//     // },
//     // {
//     //   "title": "QuickCare Urgent Clinic",
//     //   "details": "7AM-11PM • \$75 Urgent Care Fee",
//     //   "rating": 4.3,
//     //   "image": "assets/urgent.png",
//     //   "distance": "0.5 km away",
//     //   "specialties": ["Minor Injuries", "Illnesses", "X-rays"],
//     //   "waitTime": "Walk-ins welcome"
//     // },
//     // {
//     //   "title": "Women's Health Pavilion",
//     //   "details": "By Appointment • Accepts Insurance",
//     //   "rating": 4.8,
//     //   "image": "assets/womens.png",
//     //   "distance": "2.2 km away",
//     //   "specialties": ["OB/GYN", "Mammograms", "Prenatal"],
//     //   "waitTime": "2-3 days for appointment"
//     // },
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Medical Categories - Horizontal
//               SizedBox(
//                 height: 100,
//                 // child: ListView.builder(
//                 //   scrollDirection: Axis.horizontal,
//                 //   itemCount: categories.length,
//                 //   itemBuilder: (context, index) {
//                 //     final item = categories[index];
//                 //     return Container(
//                 //       width: 80,
//                 //       margin: EdgeInsets.only(right: 12),
//                 //       child: Column(
//                 //         children: [
//                 //           Container(
//                 //             width: 60,
//                 //             height: 60,
//                 //             decoration: BoxDecoration(
//                 //               color: item["color"],
//                 //               shape: BoxShape.circle,
//                 //             ),
//                 //             child: Icon(
//                 //               item["icon"],
//                 //               size: 30,
//                 //               color: Color(0xFF3661E2),
//                 //             ),
//                 //           ),
//                 //           SizedBox(height: 8),
//                 //           Text(
//                 //             item["title"],
//                 //             textAlign: TextAlign.center,
//                 //             style: TextStyle(
//                 //               fontSize: 12,
//                 //               fontWeight: FontWeight.w500,
//                 //               color: Colors.grey[800],
//                 //             ),
//                 //             maxLines: 2,
//                 //           ),
//                 //           // if (item["title"] == "View All>")
//                 //           //   Icon(Icons.chevron_right, size: 16, color: Colors.blue[800]),
//                 //         ],
//                 //       ),
//                 //     );
//                 //   },
//                 // ),
//                 child: GridView.builder(
//                   shrinkWrap: true,
//                   // physics: NeverScrollableScrollPhysics(),
//                   scrollDirection: Axis.horizontal,
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 1, // Adjust columns as needed
//                     crossAxisSpacing: 12,
//                     mainAxisSpacing: 1,
//                     childAspectRatio: 1,
//                   ),
//                   itemCount: categories.length,
//                   itemBuilder: (context, index) {
//                     final item = categories[index];
//                     return Column(
//                       children: [
//                         Container(
//                           width: 60,
//                           height: 60,
//                           decoration: BoxDecoration(
//                             color: item["color"],
//                             shape: BoxShape.circle,
//                           ),
//                           child: Icon(
//                             item["icon"],
//                             size: 30,
//                             color: Color(0xFF3661E2),
//                           ),
//                         ),
//                         SizedBox(height: 8),
//                         Text(
//                           item["title"],
//                           textAlign: TextAlign.center,
//                           style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey[800]),
//                           maxLines: 2,
//                         ),
//                       ],
//                     );
//                   },
//                 ),
//               ),
//
//               SizedBox(height: 24),
//               Text(
//                 "SPECIALTY SERVICES",
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF3661E2),
//                 ),
//               ),
//               SizedBox(height: 16),
//
//               // Health Services - Horizontal
//               SizedBox(
//                 height: 120,
//                 // child: ListView.builder(
//                 //   scrollDirection: Axis.horizontal,
//                 //   itemCount: healthServices.length,
//                 //   itemBuilder: (context, index) {
//                 //     return Container(
//                 //       width: 110,
//                 //       margin: const EdgeInsets.only(right: 12),
//                 //       decoration: BoxDecoration(
//                 //         color: Colors.blue[50],
//                 //         borderRadius: BorderRadius.circular(12),
//                 //       ),
//                 //       child: Column(
//                 //         mainAxisAlignment: MainAxisAlignment.center,
//                 //         children: [
//                 //           Container(
//                 //             width: 50,
//                 //             height: 50,
//                 //             decoration: BoxDecoration(
//                 //               color: Colors.white,
//                 //               shape: BoxShape.circle,
//                 //             ),
//                 //             child: Center(
//                 //               child: Image.asset(
//                 //                 healthServices[index]["icon"]!,
//                 //                 height: 30,
//                 //                 errorBuilder: (context, error, stackTrace) =>
//                 //                     Icon(Icons.medical_services, size: 30, color: Color(0xFF3661E2)),
//                 //               ),
//                 //             ),
//                 //           ),
//                 //           SizedBox(height: 8),
//                 //           Text(
//                 //             healthServices[index]["title"]!,
//                 //             textAlign: TextAlign.center,
//                 //             style: TextStyle(
//                 //               fontSize: 13,
//                 //               fontWeight: FontWeight.w500,
//                 //               color:Color(0xFF3661E2),
//                 //             ),
//                 //           ),
//                 //         ],
//                 //       ),
//                 //     );
//                 //   },
//                 // ),
//                 child: GridView.builder(
//                   shrinkWrap: true,
//                   // physics: NeverScrollableScrollPhysics(),
//                   scrollDirection: Axis.horizontal,
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 1, // Adjust for layout preference
//                     crossAxisSpacing: 12,
//                     mainAxisSpacing: 12,
//                     childAspectRatio: 1,
//                   ),
//                   itemCount: healthServices.length,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       decoration: BoxDecoration(
//                         color: Colors.blue[50],
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             width: 50,
//                             height: 50,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               shape: BoxShape.circle,
//                             ),
//                             child: Center(
//                               child: Image.asset(
//                                 healthServices[index]["icon"]!,
//                                 height: 30,
//                                 errorBuilder: (context, error, stackTrace) =>
//                                     Icon(Icons.medical_services, size: 30, color: Color(0xFF3661E2)),
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 8),
//                           Text(
//                             healthServices[index]["title"]!,
//                             textAlign: TextAlign.center,
//                             style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xFF3661E2)),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//
//               SizedBox(height: 24),
//               Text(
//                 "NEARBY CLINICS",
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF3661E2),
//                 ),
//               ),
//               SizedBox(height: 10),
//
//               // ListView.builder(
//               //   shrinkWrap: true,
//               //   physics: NeverScrollableScrollPhysics(),
//               //   itemCount: nearbyClinics.length,
//               //   itemBuilder: (context, index) {
//               //     final clinic = nearbyClinics[index];
//               //     return Container(
//               //       margin: EdgeInsets.only(bottom: 16),
//               //       padding: EdgeInsets.all(12),
//               //       decoration: BoxDecoration(
//               //         color: Colors.white,
//               //         borderRadius: BorderRadius.circular(12),
//               //         boxShadow: [
//               //           BoxShadow(
//               //             color: Colors.grey.withOpacity(0.1),
//               //             blurRadius: 6,
//               //             spreadRadius: 2,
//               //           )
//               //         ],
//               //       ),
//               //       child: Row(
//               //         children: [
//               //           Container(
//               //             width: 80,
//               //             height: 80,
//               //             decoration: BoxDecoration(
//               //               borderRadius: BorderRadius.circular(8),
//               //               image: DecorationImage(
//               //                 image: AssetImage(clinic["image"]),
//               //                 fit: BoxFit.cover,
//               //               ),
//               //             ),
//               //           ),
//               //           SizedBox(width: 12),
//               //           Expanded(
//               //             child: Column(
//               //               crossAxisAlignment: CrossAxisAlignment.start,
//               //               children: [
//               //                 Text(
//               //                   clinic["title"],
//               //                   style: TextStyle(
//               //                     fontSize: 16,
//               //                     fontWeight: FontWeight.bold,
//               //                     color: Colors.blue[800],
//               //                   ),
//               //                 ),
//               //                 SizedBox(height: 4),
//               //                 Text(
//               //                   clinic["distance"],
//               //                   style: TextStyle(
//               //                     fontSize: 12,
//               //                     color: Colors.grey[600],
//               //                   ),
//               //                 ),
//               //                 SizedBox(height: 4),
//               //                 Text(
//               //                   clinic["details"],
//               //                   style: TextStyle(
//               //                     fontSize: 12,
//               //                     color: Colors.grey[800],
//               //                   ),
//               //                 ),
//               //               ],
//               //             ),
//               //           ),
//               //           Column(
//               //             children: [
//               //               Row(
//               //                 children: [
//               //                   Icon(Icons.star, color: Colors.amber, size: 18),
//               //                   SizedBox(width: 4),
//               //                   Text(
//               //                     clinic["rating"].toString(),
//               //                     style: TextStyle(
//               //                       fontSize: 14,
//               //                       fontWeight: FontWeight.bold,
//               //                     ),
//               //                   ),
//               //                 ],
//               //               ),
//               //               SizedBox(height: 8),
//               //               ElevatedButton(
//               //                 onPressed: () {},
//               //                 style: ElevatedButton.styleFrom(
//               //                   backgroundColor: Colors.blue[800],
//               //                   shape: RoundedRectangleBorder(
//               //                     borderRadius: BorderRadius.circular(8),
//               //                   ),
//               //                   padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//               //                 ),
//               //                 child: Text(
//               //                   'Book',
//               //                   style: TextStyle(fontSize: 12),
//               //                 ),
//               //               ),
//               //             ],
//               //           ),
//               //         ],
//               //       ),
//               //     );
//               //   },
//               // ),
//               // Nearby Clinics
//               ListView.builder(
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 itemCount: nearbyClinics.length,
//                 itemBuilder: (context, index) {
//                   final clinic = nearbyClinics[index];
//                   return Container(
//                     margin: EdgeInsets.only(bottom: 16),
//                     padding: EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       color: Colors.grey[100],
//                       borderRadius: BorderRadius.circular(12),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.2),
//                           blurRadius: 6,
//                           spreadRadius: 2,
//                         )
//                       ],
//                     ),
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             Container(
//                               width: 80,
//                               height: 80,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(8),
//                                 image: DecorationImage(
//                                   image: AssetImage(clinic["image"]),
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: 12),
//                             Expanded(
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     clinic["title"],
//                                     style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold,
//                                       color: Color(0xFF3661E2),
//                                     ),
//                                   ),
//                                   SizedBox(height: 4),
//                                   Text(
//                                     clinic["distance"],
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       color: Colors.grey[600],
//                                     ),
//                                   ),
//                                   SizedBox(height: 4),
//                                   Text(
//                                     clinic["details"],
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       color: Colors.grey[800],
//                                     ),
//                                   ),
//                                   SizedBox(height: 4),
//                                   Text(
//                                     clinic["waitTime"],
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       color: Colors.blue[800],
//                                       fontStyle: FontStyle.italic,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Column(
//                               children: [
//                                 Row(
//                                   children: [
//                                     Icon(Icons.star, color: Colors.amber, size: 18),
//                                     SizedBox(width: 4),
//                                     Text(
//                                       clinic["rating"].toString(),
//                                       style: TextStyle(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(height: 8),
//                                 ElevatedButton(
//                                   onPressed: () {},
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Color(0xFF3661E2),
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(8),
//                                     ),
//                                     padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                                   ),
//                                   child: Text(
//                                     'Book',
//                                     style: TextStyle(fontSize: 12),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 8),
//                         Wrap(
//                           spacing: 8,
//                           runSpacing: 4,
//                           children: (clinic["specialties"] as List<String>).map((specialty) {
//                             return Chip(
//                               label: Text(
//                                 specialty,
//                                 style: TextStyle(fontSize: 11),
//                               ),
//                               backgroundColor: Colors.blue[50],
//                               visualDensity: VisualDensity.compact,
//                             );
//                           }).toList(),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CategoryScreen extends StatelessWidget {
//   const CategoryScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 16),
//             // Categories Grid (Horizontal)
//             SizedBox(
//               height: 120, // Fixed height for the horizontal grid
//               child: GridView.count(
//                 scrollDirection: Axis.horizontal,
//                 crossAxisCount: 1, // Single row for horizontal scrolling
//                 childAspectRatio: 0.6, // Adjust item aspect ratio
//                 mainAxisSpacing: 8,
//                 crossAxisSpacing: 8,
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 children: const [
//                   CategoryItem(icon: Icons.local_drink, label: 'Alcohol'),
//                   CategoryItem(icon: Icons.store, label: 'Convenience'),
//                   CategoryItem(icon: Icons.shopping_cart, label: 'Grocery'),
//                   CategoryItem(icon: Icons.local_florist, label: 'Flowers'),
//                   CategoryItem(icon: Icons.card_giftcard, label: 'Gift'),
//                   CategoryItem(icon: Icons.fiber_new, label: 'New'),
//                   CategoryItem(icon: Icons.eco, label: 'Vegetarian'),
//                   CategoryItem(icon: Icons.star, label: 'Deserve'),
//                   CategoryItem(icon: Icons.nightlight_round, label: 'Late Night Cravings'),
//                   CategoryItem(icon: Icons.more_horiz, label: 'View All>'),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 24),
//             // "FUELING FAMILY TIME" Section Header
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               child: Text(
//                 'FUELING FAMILY TIME',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 12),
//             // Restaurant Cards (Horizontal)
//             SizedBox(
//               height: 220, // Fixed height for restaurant cards
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 children: const [
//                   RestaurantCard(
//                     name: 'PITROCHARD',
//                     rating: 7.2,
//                     deliveryInfo: '23-33 mins-\$1.79 Delivery Fee Over \$10',
//                     width: 200,
//                   ),
//                   SizedBox(width: 12),
//                   RestaurantCard(
//                     name: 'SALURRY',
//                     rating: 7.5,
//                     deliveryInfo: '23-33 mins-\$1.29 Delivery Fee',
//                     width: 200,
//                   ),
//                   SizedBox(width: 12),
//                   RestaurantCard(
//                     name: 'amada',
//                     rating: 0,
//                     deliveryInfo: '',
//                     width: 200,
//                   ),
//                   SizedBox(width: 12),
//                   RestaurantCard(
//                     name: 'Subway',
//                     rating: 0,
//                     deliveryInfo: '',
//                     width: 200,
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 24),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class CategoryItem extends StatelessWidget {
//   final IconData icon;
//   final String label;
//
//   const CategoryItem({
//     super.key,
//     required this.icon,
//     required this.label,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 80, // Fixed width for each category item
//       padding: const EdgeInsets.all(4),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           CircleAvatar(
//             radius: 24,
//             backgroundColor: Colors.grey[200],
//             child: Icon(icon, size: 24),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             label,
//             style: const TextStyle(fontSize: 12),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class RestaurantCard extends StatelessWidget {
//   final String name;
//   final double rating;
//   final String deliveryInfo;
//   final double width;
//
//   const RestaurantCard({
//     super.key,
//     required this.name,
//     required this.rating,
//     required this.deliveryInfo,
//     this.width = double.infinity,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: width,
//       child: Card(
//         elevation: 2,
//         child: Padding(
//           padding: const EdgeInsets.all(12),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: 120,
//                 width: double.infinity,
//                 color: Colors.grey[300],
//                 child: Center(
//                   child: Text(
//                     name,
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 8),
//               if (rating > 0)
//                 Row(
//                   children: [
//                     const Icon(Icons.star, color: Colors.orange, size: 16),
//                     const SizedBox(width: 4),
//                     Text(
//                       rating.toString(),
//                       style: const TextStyle(fontSize: 14),
//                     ),
//                   ],
//                 ),
//               const SizedBox(height: 4),
//               if (deliveryInfo.isNotEmpty)
//                 Text(
//                   deliveryInfo,
//                   style: const TextStyle(
//                     fontSize: 12,
//                     color: Colors.grey,
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// class MedicalCategoriesPage extends StatelessWidget {
//   final List<MedicalCategory> categories = [
//     MedicalCategory(name: 'Pharmacy', icon: Icons.local_pharmacy),
//     MedicalCategory(name: 'Lab Tests', icon: Icons.science),
//     MedicalCategory(name: 'General', icon: Icons.medical_services),
//     MedicalCategory(name: 'Cardiology', icon: Icons.favorite),
//     MedicalCategory(name: 'Pediatrics', icon: Icons.child_care),
//     MedicalCategory(name: 'Orthopedics', icon: Icons.accessible),
//     MedicalCategory(name: 'Neurology', icon: Icons.memory),
//     MedicalCategory(name: 'Emergency', icon: Icons.emergency),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: GridView.builder(
//                 scrollDirection: Axis.horizontal,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 16,
//                   mainAxisSpacing: 16,
//                   childAspectRatio: 1.2,
//                 ),
//                 itemCount: categories.length,
//                 itemBuilder: (context, index) {
//                   return MedicalCategoryCard(category: categories[index]);
//                 },
//               ),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class MedicalCategory {
//   final String name;
//   final IconData icon;
//
//   MedicalCategory({required this.name, required this.icon});
// }
//
// class MedicalCategoryCard extends StatelessWidget {
//   final MedicalCategory category;
//
//   const MedicalCategoryCard({Key? key, required this.category}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 2,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: InkWell(
//         borderRadius: BorderRadius.circular(8),
//         onTap: () {
//           // Handle category tap
//           print('${category.name} tapped');
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(
//                 category.icon,
//                 size: 40,
//                 color: Colors.blue,
//               ),
//               SizedBox(height: 10),
//               Text(
//                 category.name,
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
