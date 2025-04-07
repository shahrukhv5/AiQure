import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// class WowSaleBanner extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width * 0.9,
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.pink.shade100,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.3),
//             blurRadius: 8,
//             spreadRadius: 2,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Stack(
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Align(
//                 alignment: Alignment.topRight,
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                   decoration: BoxDecoration(
//                     color: Colors.pink.shade700,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Text(
//                     "WOW SALE\n17-21 MARCH",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 "Get up to 50% off",
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               Text(
//                 "on our range of Comprehensive\nFull Body Checkups",
//                 style: TextStyle(fontSize: 16, color: Colors.black87),
//               ),
//               SizedBox(height: 8),
//               Row(
//                 children: [
//                   Text(
//                     "Extra benefits with ",
//                     style: TextStyle(fontSize: 16, color: Colors.black54),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 12),
//               ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.black,
//                   padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: Text(
//                   "Book now",
//                   style: TextStyle(fontSize: 16, color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//           Positioned(
//             right: 0,
//             bottom: 0,
//             child: Image.asset(
//               'assets/doctor_image.png', // Replace with actual doctor image
//               height: 120,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 buildCard(
//                   color: Colors.pink.shade300,
//                   title: 'Pharmacy',
//                   subtitle: 'Up to 25% off',
//                   image: Icons.medical_services, // Placeholder icon
//                 ),
//                 buildCard(
//                   color: Colors.blue.shade400,
//                   title: 'Labs',
//                   subtitle: 'Book & save tax',
//                   image: Icons.savings, // Placeholder icon
//                 ),
//                 buildCard(
//                   color: Colors.green.shade400,
//                   title: 'Records',
//                   subtitle: '& Insights',
//                   image: Icons.insights, // Placeholder icon
//                 ),
//               ],
//             ),
//             SizedBox(height: 20,),
//             WelcomeOfferBanner(),
//             SizedBox(height: 20,),
//             SaleBannerList()
//           ],
//         ),
//       ),
//     );
//   }
//   Widget buildCard({
//     required Color color,
//     required String title,
//     required String subtitle,
//     required IconData image,
//     String? tag,
//   }) {
//     return Expanded(
//       child: Container(
//         height: 150,
//         margin: EdgeInsets.symmetric(horizontal: 6),
//         padding: EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           color: color,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Stack(
//           children: [
//             if (tag != null)
//               Positioned(
//                 top: 6,
//                 left: 6,
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(6),
//                   ),
//                   child: Text(
//                     tag,
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 12,
//                     ),
//                   ),
//                 ),
//               ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 6),
//                 Text(
//                   subtitle,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 14,
//                   ),
//                 ),
//                 Spacer(),
//                 Align(
//                   alignment: Alignment.bottomRight,
//                   child: Icon(
//                     image,
//                     color: Colors.white,
//                     size: 40,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// class WelcomeOfferBanner extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.3),
//             blurRadius: 8,
//             spreadRadius: 2,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Stack(
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Text(
//                     "Welcome offer",
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                   SizedBox(width: 5),
//                   Expanded(
//                     child: Container(
//                       height: 2,
//                       color: Colors.amber,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 8),
//               RichText(
//                 text: TextSpan(
//                   children: [
//                     TextSpan(
//                       text: "15% extra off",
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.purple.shade700,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 8),
//               Row(
//                 children: [
//                   Text(
//                     "on first order | Use code",
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   SizedBox(width: 6),
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                     decoration: BoxDecoration(
//                       color: Colors.green.shade100,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Text(
//                       "NEWM",
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.green.shade900,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 6),
//               Text(
//                 "T&C apply",
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.grey,
//                 ),
//               ),
//             ],
//           ),
//           Positioned(
//             top: 20,
//             right: 0,
//             child: Image.asset(
//               'assets/welcome.jpg', // Replace with your actual asset
//               height: 70,
//               width: 100,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class WowSaleBanner extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width * 0.8,
//       margin: EdgeInsets.only(right: 16),
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.pink.shade100,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.3),
//             blurRadius: 8,
//             spreadRadius: 2,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Stack(
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Align(
//                 alignment: Alignment.topRight,
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                   decoration: BoxDecoration(
//                     color: Colors.pink.shade700,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Text(
//                     "WOW SALE\n17-21 MARCH",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 12,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 "Get up to 50% off",
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               Text(
//                 "on our range of Comprehensive\nFull Body Checkups",
//                 style: TextStyle(fontSize: 16, color: Colors.black87),
//               ),
//               SizedBox(height: 8),
//               Row(
//                 children: [
//                   Text(
//                     "Extra benefits with ",
//                     style: TextStyle(fontSize: 16, color: Colors.black54),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 12),
//               ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.black,
//                   padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: Text(
//                   "Book now",
//                   style: TextStyle(fontSize: 16, color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//           Positioned(
//             right: 0,
//             bottom: 0,
//             child: Image.asset(
//               'assets/doctor_image.png', // Doctor image
//               height: 120,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class SaleBannerList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 20),
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Row(
//           children: List.generate(5, (index) => WowSaleBanner()), // 5 Banners
//         ),
//       ),
//     );
//   }
// }

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[200],
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: buildCard(
                    color: Colors.pink.shade300,
                    title: 'Pharmacy',
                    subtitle: 'Up to 25% off',
                    image: Icons.medical_services,
                  ),
                ),
                Flexible(
                  child: buildCard(
                    color: Colors.blue.shade400,
                    title: 'Labs',
                    subtitle: 'Book & save tax',
                    image: Icons.savings,
                  ),
                ),
                Flexible(
                  child: buildCard(
                    color: Colors.green.shade400,
                    title: 'Records',
                    subtitle: '& Insights',
                    image: Icons.insights,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            WelcomeOfferBanner(),
            SizedBox(height: 20),
            Expanded(
              child: SaleBannerList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard({
    required Color color,
    required String title,
    required String subtitle,
    required IconData image,
    String? tag,
  }) {
    return Container(
      height: 150,
      margin: EdgeInsets.symmetric(horizontal: 6),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          if (tag != null)
            Positioned(
              top: 6,
              left: 6,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  tag,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: Icon(
                  image,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WelcomeOfferBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 8,
            spreadRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Welcome offer",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: Container(
                      height: 2,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                "15% extra off",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple.shade700,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    "on first order | Use code",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(width: 6),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "NEWM",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade900,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6),
              Text(
                "T&C apply",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Positioned(
            top: 20,
            right: 0,
            child: Image.asset(
              'assets/welcome.jpg',
              height: 70,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

class WowSaleBanner extends StatelessWidget {
  final Color backgroundColor;

  WowSaleBanner({required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin: EdgeInsets.only(right: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor, // Dynamic Background Color
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(

            color: Colors.white,
            blurRadius: 8,
            spreadRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.pink.shade700,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "WOW SALE\n17-21 MARCH",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Get up to 50% off",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                "on our range of Comprehensive\nFull Body Checkups",
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    "Extra benefits with ",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Book now",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Image.asset(
              'assets/doctor_image.png', // Doctor image
              height: 120,
            ),
          ),
        ],
      ),
    );
  }
}

class SaleBannerList extends StatelessWidget {
  final List<Color> bannerColors = [
    Colors.pink.shade100,
    Colors.blue.shade100,
    Colors.green.shade100,
    Colors.orange.shade100,
    Colors.purple.shade100,
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          bannerColors.length,
              (index) => WowSaleBanner(backgroundColor: bannerColors[index]),
        ),
      ),
    );
  }
}
// class CategoryCard extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final String imagePath;
//   final Color color;
//
//   CategoryCard(this.title, this.subtitle, this.imagePath, this.color);
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: 5),
//         padding: EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           color: color,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           children: [
//             Image.asset(imagePath, height: 40, width: 40),
//             SizedBox(height: 5),
//             Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//             Text(subtitle, style: TextStyle(color: Colors.white70, fontSize: 12)),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class InvestmentCard extends StatelessWidget {
//   final String title;
//   final String imagePath;
//
//   InvestmentCard(this.title, this.imagePath);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Image.asset(imagePath, height: 50, width: 50),
//         SizedBox(height: 5),
//         Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
//       ],
//     );
//   }
// }