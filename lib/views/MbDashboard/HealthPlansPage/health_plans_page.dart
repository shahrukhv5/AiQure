import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HealthPlansPage extends StatelessWidget {
  const HealthPlansPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Health Plans", style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 10,),
              const Text(
                "Most upvoted plans, sessions and articles for you!",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 10),

              // Category Buttons
              Wrap(
                spacing: 10,
                children: [
                  _categoryChip("Insurance"),
                  _categoryChip("Diabetes"),
                  _categoryChip("Mental Wellness"),
                  _categoryChip("Weight Management"),
                  _categoryChip("Ivf"),
                ],
              ),
              const SizedBox(height: 20),

              // Diabetes Plan
              _healthPlanCard(
                imageUrl: "assets/health_plans_images/diabetes.png",
                title: "Your Diabetes Remission\njourney starts here",
                price: "₹2166 per month",
                buttonText1: "Know more",
                buttonText2: "Get custom plans",
              ),

              const SizedBox(height: 20),

              // Vertigo Plan
              _healthPlanCard(
                imageUrl: "assets/health_plans_images/vertigo.webp",
                title: "Struggling with\nVertigo (Chakkar)?",
                subtitle:
                "World’s largest chain of clinics for Vertigo, Dizziness & Balance Disorders",
                buttonText1: "Know more",
                buttonText2: "Get custom plans",
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Category Buttons
  Widget _categoryChip(String text) {
    return Chip(
      label: Text(text),
      backgroundColor: Colors.grey[200],
    );
  }

  // Health Plan Card
  Widget _healthPlanCard({
    required String imageUrl,
    required String title,
    String? subtitle,
    String? price,
    required String buttonText1,
    String? buttonText2,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imageUrl, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
                if (price != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    "Starting at just $price",
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
                const SizedBox(height: 16),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          // backgroundColor: Colors.red
                      ),
                      child: Text(buttonText1),
                    ),
                    if (buttonText2 != null) ...[
                      const SizedBox(width: 10),
                      OutlinedButton(
                        onPressed: () {},
                        child: Text(buttonText2),
                      ),
                    ]
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}