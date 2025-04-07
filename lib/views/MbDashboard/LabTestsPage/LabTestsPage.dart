// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
// class LabTestsPage extends StatelessWidget {
//   const LabTestsPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: CustomScrollView(
//         slivers: [
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.all(24.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Booking Options
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       _buildOption(
//                         Icons.call,
//                         "Book via",
//                         "Call",
//                         Colors.blue.shade100,
//                         Colors.blue,
//                       ),
//                       _buildOption(
//                         Icons.medical_services,
//                         "Upload",
//                         "Prescription",
//                         Colors.pink.shade100,
//                         Colors.pink,
//                       ),
//                       _buildOption(
//                         FontAwesomeIcons.whatsapp,
//                         "Book via",
//                         "Whatsapp",
//                         Colors.green.shade100,
//                         Colors.green,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//
//                   // Header Section
//                   const Text(
//                     'Save Smart with Preventive Health Checkups',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 5),
//                   const Text(
//                     'Claim tax deduction up to ₹5,000* u/s 80D',
//                     style: TextStyle(color: Colors.purple),
//                   ),
//                   const SizedBox(height: 20),
//
//                   // Tax Saver Cards
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       _buildTaxSaverCard(
//                         '56%',
//                         'Basic Tax Saver',
//                         'assets/lab_tests/family1.jpg',
//                       ),
//                       _buildTaxSaverCard(
//                         '57%',
//                         'Advanced Tax Saver',
//                         'assets/lab_tests/family2.jpg',
//                       ),
//                       _buildTaxSaverCard(
//                         '53%',
//                         'Premium Tax Saver',
//                         'assets/lab_tests/family3.jpg',
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//
//                   // NABL Accredited Labs
//                   Container(
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.blue[100],
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: Row(
//                       children: [
//                         const Icon(
//                           Icons.verified,
//                           color: Color(0xFF3661E2),
//                           size: 40,
//                         ),
//                         const SizedBox(width: 16),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: const [
//                             Text(
//                               'NABL accredited labs*',
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color(0xFF3661E2),
//                               ),
//                             ),
//                             Text(
//                               'Quality diagnostics you can rely on',
//                               style: TextStyle(fontSize: 15),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           // Lab Tests & Packages Section
//           SliverToBoxAdapter(child: _buildLabTestsPackages()),
//         ],
//       ),
//     );
//   }
//
//   // Widget for booking options
//   Widget _buildOption(
//     IconData icon,
//     String text1,
//     String text2,
//     Color color,
//     Color iconColor,
//   ) {
//     return Container(
//       width: 120,
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Column(
//         children: [
//           Icon(icon, size: 50, color: iconColor),
//           const SizedBox(height: 12),
//           Text(
//             text1,
//             style: const TextStyle(fontSize: 15, color: Colors.black54),
//           ),
//           Text(
//             text2,
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Widget for tax saver cards
//   Widget _buildTaxSaverCard(String discount, String title, String imagePath) {
//     return Column(
//       children: [
//         Text(
//           "$discount OFF",
//           style: const TextStyle(
//             fontSize: 18,
//             color: Colors.red,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(height: 5),
//         ClipRRect(
//           borderRadius: BorderRadius.circular(12),
//           child: Image.asset(
//             imagePath,
//             height: 120,
//             width: 120,
//             fit: BoxFit.cover,
//           ),
//         ),
//         const SizedBox(height: 5),
//         Text(
//           title,
//           style: const TextStyle(fontSize: 15),
//           textAlign: TextAlign.center,
//         ),
//       ],
//     );
//   }
//
//   // Lab Tests & Packages Section
//   Widget _buildLabTestsPackages() {
//     return Padding(
//       padding: const EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Lab tests & packages',
//             style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 20),
//
//           // Top categories
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               _buildCategory(
//                 image: 'assets/lab_tests/women.png',
//                 label: 'For Women',
//                 isSelected: true,
//               ),
//               _buildCategory(
//                 image: 'assets/lab_tests/men.jpeg',
//                 label: 'For Men',
//                 isSelected: false,
//               ),
//               _buildCategory(
//                 image: 'assets/lab_tests/lifestyle_checkups.jpg',
//                 label: 'Lifestyle\nCheckups',
//                 isSelected: false,
//               ),
//               _buildCategory(
//                 image: 'assets/lab_tests/health_concerns.webp',
//                 label: 'Health\nConcerns',
//                 isSelected: false,
//               ),
//             ],
//           ),
//           const SizedBox(height: 30),
//
//           // Sub-categories
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               _buildSubCategory(
//                 image: 'assets/lab_tests/women.png',
//                 label: 'Adult Women',
//               ),
//               _buildSubCategory(
//                 image: 'assets/lab_tests/senior_women.jpg',
//                 label: 'Senior Women',
//               ),
//               _buildSubCategory(
//                 image: 'assets/lab_tests/fitness.jpg',
//                 label: 'Fitness',
//               ),
//             ],
//           ),
//           const SizedBox(height: 20),
//
//           // Explore button
//           SizedBox(
//             width: double.infinity,
//             height: 50,
//             child: ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Color(0xFF3661E2),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               child: const Text(
//                 'Explore Packages for Women',
//                 style: TextStyle(fontSize: 18, color: Colors.white),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Top categories widget
//   Widget _buildCategory({
//     required String image,
//     required String label,
//     bool isSelected = false,
//   }) {
//     return Column(
//       children: [
//         Container(
//           width: 90,
//           height: 90,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: isSelected ? Colors.blue.shade100 : Colors.grey.shade200,
//             image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
//           ),
//         ),
//         const SizedBox(height: 12),
//         Text(
//           label,
//           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//         ),
//       ],
//     );
//   }
//
//   // Sub-categories widget
//   Widget _buildSubCategory({required String image, required String label}) {
//     return Column(
//       children: [
//         ClipRRect(
//           borderRadius: BorderRadius.circular(12),
//           child: Image.asset(image, width: 120, height: 120, fit: BoxFit.cover),
//         ),
//         const SizedBox(height: 12),
//         Text(label, style: const TextStyle(fontSize: 16)),
//       ],
//     );
//   }
// }
//
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../models/CartItem/cart_item.dart';
import '../../../providers/cart_provider.dart';
import '../CartPage/cart_page.dart';

class LabTestsPage extends StatefulWidget {
  const LabTestsPage({super.key});

  @override
  State<LabTestsPage> createState() => _LabTestsPageState();
}

class _LabTestsPageState extends State<LabTestsPage> {
  // State variables to track selected category and subcategory
  String selectedCategory = 'For Women';
  String selectedSubCategory = 'Adult Women';

  // Data for different categories and their subctg
  final Map<String, List<Map<String, String>>> categoryData = {
    'For Women': [
      {'image': 'assets/lab_tests/women.png', 'label': 'Adult Women'},
      {'image': 'assets/lab_tests/senior_women.jpg', 'label': 'Senior Women'},
      {'image': 'assets/lab_tests/fitness.jpg', 'label': 'Fitness'},
    ],
    'For Men': [
      {'image': 'assets/lab_tests/mens/adult_men.jpeg', 'label': 'Adult Men'},
      {'image': 'assets/lab_tests/mens/senior_men.jpg', 'label': 'Senior Men'},
      {
        'image': 'assets/lab_tests/mens/fitness_men.jpg',
        'label': 'Men Fitness',
      },
    ],
    'Lifestyle Checkups': [
      {'image': 'assets/lab_tests/lifestyle/diabetes.jpg', 'label': 'Diabetes'},
      {
        'image': 'assets/lab_tests/lifestyle/heart_care.jpg',
        'label': 'Heart Care',
      },
      {'image': 'assets/lab_tests/lifestyle/thyroid.jpg', 'label': 'Thyroid'},
    ],
    'Health Concerns': [
      {'image': 'assets/lab_tests/health/fever.jpg', 'label': 'Fever'},
      {'image': 'assets/lab_tests/health/COVID_19.jpg', 'label': 'COVID-19'},
      {'image': 'assets/lab_tests/health/allergy.jpg', 'label': 'Allergy'},
    ],
  };

  // Button text based on selected category
  String getButtonText() {
    switch (selectedCategory) {
      case 'For Women':
        return 'Explore Packages for Women';
      case 'For Men':
        return 'Explore Packages for Men';
      case 'Lifestyle Checkups':
        return 'Explore Lifestyle Checkups';
      case 'Health Concerns':
        return 'Explore Health Concerns';
      default:
        return 'Explore Packages';
    }
  }

  // Navigate to package page
  void _navigateToPackagePage(String subCategory) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => PackagePage(
              category: selectedCategory,
              subCategory: subCategory,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Booking Options
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildOption(
                        Icons.call,
                        "Book via",
                        "Call",
                        Colors.blue.shade100,
                        Colors.blue,
                      ),
                      _buildOption(
                        Icons.medical_services,
                        "Upload",
                        "Prescription",
                        Colors.pink.shade100,
                        Colors.pink,
                      ),
                      _buildOption(
                        FontAwesomeIcons.whatsapp,
                        "Book via",
                        "Whatsapp",
                        Colors.green.shade100,
                        Colors.green,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Header Section
                  const Text(
                    'Save Smart with Preventive Health Checkups',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Claim tax deduction up to ₹5,000* u/s 80D',
                    style: TextStyle(color: Colors.purple),
                  ),
                  const SizedBox(height: 20),

                  // Tax Saver Cards
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildTaxSaverCard(
                        '56%',
                        'Basic Tax Saver',
                        'assets/lab_tests/family1.jpg',
                      ),
                      _buildTaxSaverCard(
                        '57%',
                        'Advanced Tax Saver',
                        'assets/lab_tests/family2.jpg',
                      ),
                      _buildTaxSaverCard(
                        '53%',
                        'Premium Tax Saver',
                        'assets/lab_tests/family3.jpg',
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // NABL Accredited Labs
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.verified,
                          color: Color(0xFF3661E2),
                          size: 40,
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'NABL accredited labs*',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF3661E2),
                              ),
                            ),
                            Text(
                              'Quality diagnostics you can rely on',
                              style: TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Lab Tests & Packages Section
          SliverToBoxAdapter(child: _buildLabTestsPackages()),
        ],
      ),
    );
  }

  // Widget for booking options
  Widget _buildOption(
    IconData icon,
    String text1,
    String text2,
    Color color,
    Color iconColor,
  ) {
    return Container(
      width: 120,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, size: 50, color: iconColor),
          const SizedBox(height: 12),
          Text(
            text1,
            style: const TextStyle(fontSize: 15, color: Colors.black54),
          ),
          Text(
            text2,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // Widget for tax saver cards
  Widget _buildTaxSaverCard(String discount, String title, String imagePath) {
    return Column(
      children: [
        Text(
          "$discount OFF",
          style: const TextStyle(
            fontSize: 18,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imagePath,
            height: 120,
            width: 120,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(fontSize: 15),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  // Lab Tests & Packages Section
  Widget _buildLabTestsPackages() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Lab tests & packages',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Top categories
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCategory(
                image: 'assets/lab_tests/women.png',
                label: 'For Women',
                isSelected: selectedCategory == 'For Women',
                onTap: () {
                  setState(() {
                    selectedCategory = 'For Women';
                    selectedSubCategory =
                        categoryData['For Women']![0]['label']!;
                  });
                },
              ),
              _buildCategory(
                image: 'assets/lab_tests/men.jpeg',
                label: 'For Men',
                isSelected: selectedCategory == 'For Men',
                onTap: () {
                  setState(() {
                    selectedCategory = 'For Men';
                    selectedSubCategory = categoryData['For Men']![0]['label']!;
                  });
                },
              ),
              _buildCategory(
                image: 'assets/lab_tests/lifestyle_checkups.jpg',
                label: 'Lifestyle\nCheckups',
                isSelected: selectedCategory == 'Lifestyle Checkups',
                onTap: () {
                  setState(() {
                    selectedCategory = 'Lifestyle Checkups';
                    selectedSubCategory =
                        categoryData['Lifestyle Checkups']![0]['label']!;
                  });
                },
              ),
              _buildCategory(
                image: 'assets/lab_tests/health_concerns.webp',
                label: 'Health\nConcerns',
                isSelected: selectedCategory == 'Health Concerns',
                onTap: () {
                  setState(() {
                    selectedCategory = 'Health Concerns';
                    selectedSubCategory =
                        categoryData['Health Concerns']![0]['label']!;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 30),

          // Sub-categories
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:
                categoryData[selectedCategory]!.map((subCategory) {
                  return _buildSubCategory(
                    image: subCategory['image']!,
                    label: subCategory['label']!,
                    onTap: () => _navigateToPackagePage(subCategory['label']!),
                  );
                }).toList(),
          ),
          const SizedBox(height: 20),

          // Explore button
          // Update the onPressed handler for the Explore button
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                // Navigate to a page showing all packages for the selected category
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => AllPackagesPage(
                          category: selectedCategory,
                          subCategories: categoryData[selectedCategory]!,
                        ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF3661E2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                getButtonText(),
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategory({
    required String image,
    required String label,
    bool isSelected = false,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? Colors.blue.shade100 : Colors.grey.shade200,
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Colors.black : Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  // Sub-categories widget
  Widget _buildSubCategory({
    required String image,
    required String label,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                image,
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              label,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class PackagePage extends StatelessWidget {
  final String category;
  final String subCategory;
  final String packageId;

  const PackagePage({
    super.key,
    required this.category,
    required this.subCategory,
    this.packageId = '',
  });

  // Sample package data - you can replace this with your actual data
  List<Map<String, dynamic>> getPackages() {
    if (subCategory == 'Adult Women') {
      return [
        {
          'id': '1',
          'image': 'assets/lab_tests/womens/vitamin_d.jpg',
          'name': 'Vitamin D Test',
          'description': 'Check vitamin D levels in your body',
          'price': 699.00,
          'discount': '20% OFF',
        },
        {
          'id': '2',
          'image': 'assets/lab_tests/lifestyle/thyroid.jpg',
          'name': 'Thyroid Profile',
          'description': 'Complete thyroid function test',
          'price': 899.00,
          'discount': '15% OFF',
        },
        {
          'id': '3',
          'image': 'assets/lab_tests/womens/iron.jpg',
          'name': 'Iron Study',
          'description': 'Check iron levels and storage',
          'price': 799.00,
          'discount': '10% OFF',
        },
        {
          'id': '4',
          'image': 'assets/lab_tests/lifestyle/diabetes.jpg',
          'name': 'Diabetes Screening',
          'description': 'Complete diabetes checkup',
          'price': 599.00,
          'discount': '25% OFF',
        },
        {
          'id': '5',
          'image': 'assets/lab_tests/womens/hormone.jpg',
          'name': 'Hormone Panel',
          'description': 'Comprehensive hormone testing',
          'price': 1299.00,
          'discount': '30% OFF',
        },
      ];
    }
    // Add more conditions for other subctg...
    else {
      return [
        {
          'id': '6',
          'image': 'assets/lab_tests/subctg/basic.jpg',
          'name': 'Basic Health Check',
          'description': 'Essential health parameters',
          'price': 499.00,
          'discount': '10% OFF',
        },
        {
          'id': '7',
          'image': 'assets/lab_tests/subctg/complete.jpg',
          'name': 'Complete Blood Count',
          'description': 'Full blood work analysis',
          'price': 399.00,
          'discount': '5% OFF',
        },
        {
          'id': '8',
          'image': 'assets/lab_tests/subctg/liver.jpg',
          'name': 'Liver Function Test',
          'description': 'Check liver health markers',
          'price': 699.00,
          'discount': '15% OFF',
        },
        {
          'id': '9',
          'image': 'assets/lab_tests/subctg/kidney.jpg',
          'name': 'Kidney Function Test',
          'description': 'Evaluate kidney performance',
          'price': 599.00,
          'discount': '10% OFF',
        },
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final packages = getPackages();

    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('$subCategory Packages'),
    //     actions: [
    //       Stack(
    //         children: [
    //           IconButton(
    //             icon: Icon(Icons.shopping_bag),
    //             onPressed: () {
    //               Navigator.push(
    //                 context,
    //                 MaterialPageRoute(builder: (context) => CartPage()),
    //               );
    //             },
    //           ),
    //           if (cart.items.isNotEmpty)
    //             Positioned(
    //               right: 8,
    //               top: 8,
    //               child: CircleAvatar(
    //                 radius: 8,
    //                 backgroundColor: Colors.red,
    //                 child: Text(
    //                   cart.items.length.toString(),
    //                   style: TextStyle(color: Colors.white, fontSize: 10),
    //                 ),
    //               ),
    //             ),
    //         ],
    //       ),
    //     ],
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.all(16.0),
    //     child: ListView.builder(
    //       itemCount: packages.length,
    //       itemBuilder: (context, index) {
    //         final package = packages[index];
    //         final isInCart = cart.items.any((item) => item.id == package['id']);
    //
    //         return Card(
    //           margin: const EdgeInsets.only(bottom: 16),
    //           shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(12),
    //           ),
    //           child: Padding(
    //             padding: const EdgeInsets.all(12.0),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //
    //               children: [
    //                 ClipRRect(
    //                   borderRadius: BorderRadius.circular(8),
    //                   child: Image.asset(
    //                     package['image'],
    //                     width: double.infinity,
    //                     height: 150,
    //                     fit: BoxFit.cover,
    //                   ),
    //                 ),
    //                 const SizedBox(height: 12),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Text(
    //                       package['name'],
    //                       style: const TextStyle(
    //                         fontSize: 18,
    //                         fontWeight: FontWeight.bold,
    //                       ),
    //                     ),
    //                     Container(
    //                       padding: const EdgeInsets.symmetric(
    //                         horizontal: 8,
    //                         vertical: 4,
    //                       ),
    //                       decoration: BoxDecoration(
    //                         color: Colors.green,
    //                         borderRadius: BorderRadius.circular(4),
    //                       ),
    //                       child: Text(
    //                         package['discount'],
    //                         style: const TextStyle(
    //                           color: Colors.white,
    //                           fontSize: 12,
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 const SizedBox(height: 8),
    //                 Text(
    //                   package['description'],
    //                   style: const TextStyle(fontSize: 14, color: Colors.grey),
    //                 ),
    //
    //                 const SizedBox(height: 12),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Text(
    //                       '₹${package['price'].toStringAsFixed(2)}',
    //                       style: const TextStyle(
    //                         fontSize: 18,
    //                         fontWeight: FontWeight.bold,
    //                         color: Colors.blue,
    //                       ),
    //                     ),
    //                     SizedBox(
    //                       width: 150, // Fixed width for consistent button size
    //                       child:
    //                           isInCart
    //                               ? OutlinedButton.icon(
    //                                 style: OutlinedButton.styleFrom(
    //                                   foregroundColor: Colors.green,
    //                                   side: const BorderSide(
    //                                     color: Colors.green,
    //                                   ),
    //                                 ),
    //                                 onPressed: () {
    //                                   cart.removeItem(package['id']);
    //                                   ScaffoldMessenger.of(
    //                                     context,
    //                                   ).showSnackBar(
    //                                     SnackBar(
    //                                       content: Text(
    //                                         'Removed ${package['name']} from cart',
    //                                       ),
    //                                     ),
    //                                   );
    //                                 },
    //                                 icon: const Icon(Icons.close, size: 18),
    //                                 label: const Text('Added'),
    //                               )
    //                               : ElevatedButton(
    //                                 onPressed: () {
    //                                   cart.addItem(
    //                                     CartItem(
    //                                       id: package['id'],
    //                                       name: package['name'],
    //                                       description: package['description'],
    //                                       price: package['price'],
    //                                       image: package['image'],
    //                                     ),
    //                                   );
    //                                   ScaffoldMessenger.of(
    //                                     context,
    //                                   ).showSnackBar(
    //                                     SnackBar(
    //                                       content: Text(
    //                                         'Added ${package['name']} to cart',
    //                                       ),
    //                                     ),
    //                                   );
    //                                 },
    //                                 child: const Text('Book Now'),
    //                               ),
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ),
    //         );
    //       },
    //     ),
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$subCategory Packages',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            // color: theme.colorScheme.onPrimary,
          ),
        ),
        // backgroundColor: theme.primaryColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                IconButton(
                  icon: Icon(Icons.shopping_bag_outlined, size: 28),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartPage()),
                    );
                  },
                ),
                if (cart.items.isNotEmpty)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      constraints: BoxConstraints(
                        minWidth: 20,
                        minHeight: 20,
                      ),
                      child: Center(
                        child: Text(
                          cart.items.length.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: packages.length,
          separatorBuilder: (context, index) => SizedBox(height: 16),
          itemBuilder: (context, index) {
            final package = packages[index];
            final isInCart = cart.items.any((item) => item.id == package['id']);

            return Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        child: Image.asset(
                          package['image'],
                          width: double.infinity,
                          height: 160,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                            height: 160,
                            color: Colors.grey[200],
                            child: Icon(Icons.image_not_supported, size: 40),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 12,
                        right: 12,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            package['discount'],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          package['name'],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            // color: theme.primaryColorDark,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          package['description'],
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                            height: 1.4,
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Price',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                Text(
                                  '₹${package['price'].toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    // color: theme.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 150,
                              height: 42,
                              child: isInCart
                                  ? OutlinedButton.icon(
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.green,
                                  side: BorderSide(color: Colors.green),
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {
                                  cart.removeItem(package['id']);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Removed ${package['name']} from cart'),
                                      action: SnackBarAction(
                                        label: 'UNDO',
                                        onPressed: () {
                                          cart.addItem(CartItem(
                                            id: package['id'],
                                            name: package['name'],
                                            description: package['description'],
                                            price: package['price'],
                                            image: package['image'],
                                          ));
                                        },
                                      ),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.close, size: 18),
                                label: Text('Added', style: TextStyle(fontSize: 14)),
                              )
                                  : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  // backgroundColor: theme.primaryColor,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                ),
                                onPressed: () {
                                  cart.addItem(CartItem(
                                    id: package['id'],
                                    name: package['name'],
                                    description: package['description'],
                                    price: package['price'],
                                    image: package['image'],
                                  ));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Added ${package['name']} to cart'),
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  );
                                },
                                child: Text('Book Now', style: TextStyle(fontSize: 14)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class AllPackagesPage extends StatelessWidget {
  final String category;
  final List<Map<String, String>> subCategories;

  const AllPackagesPage({
    super.key,
    required this.category,
    required this.subCategories,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All $category Packages')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All Packages for $category',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: subCategories.length,
                itemBuilder: (context, index) {
                  final subCategory = subCategories[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              subCategory['image']!,
                              width: double.infinity,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            subCategory['label']!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'View all packages for this category',
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                // Navigate to specific subcategory packages
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => PackagePage(
                                          category: category,
                                          subCategory: subCategory['label']!,
                                        ),
                                  ),
                                );
                              },
                              child: const Text('View Packages'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
