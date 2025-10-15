import 'package:flutter/material.dart';
import '../widgets/appBar.dart';
import '../widgets/gradient_background.dart';
import '../widgets/info_card.dart';
import '../widgets/certificate_card.dart';

class CertificateScreen extends StatelessWidget {
  const CertificateScreen({super.key});

  static const String name = "CertificateScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(appBarTitle: 'Certificates',),
      extendBodyBehindAppBar: true,
      body: GradientBackground(
        child:  SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoCard(
                    title: "Total Certificates",
                    value: "3",
                    gradientColors: [Colors.blue, Colors.lightBlueAccent],
                    icon: Icons.workspace_premium,
                  ),
                  InfoCard(
                    title: "Completed Courses",
                    value: "8",
                    gradientColors: [Colors.purpleAccent, Colors.pink],
                    icon: Icons.check_circle_outline,
                  ),
                  InfoCard(
                    title: "Learning Hours",
                    value: "30+",
                    gradientColors: [Colors.green, Colors.lightGreen],
                    icon: Icons.access_time,
                  ),
                  const SizedBox(height: 10),
                  CertificateCard(
                    title: "Flutter Development Master",
                    grade: "A+",
                    date: DateTime(2024, 3, 15),
                    hours: 12,
                    certificateId: "CERT-000001",
                    IconColor: Colors.blueAccent,
                  ),
                  const SizedBox(height: 10),
                  CertificateCard(
                    title: "Python Beginners",
                    grade: "A+",
                    date: DateTime(2024, 5, 15),
                    hours: 12,
                    certificateId: "CERT-002601",
                    IconColor: Colors.green,
                  ),
                  const SizedBox(height: 10),
                  CertificateCard(
                    title: "JavaScript",
                    grade: "A",
                    date: DateTime(2024, 7, 22),
                    hours: 15,
                    certificateId: "CERT-002601",
                    IconColor: Colors.orange,
                  ),
                ],
              ),
            ),
          ),
        );
  }
}

