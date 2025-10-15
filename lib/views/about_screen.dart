import 'package:flutter/material.dart';
import '../widgets/appBar.dart';
import '../widgets/gradient_background.dart';
import '../widgets/logo_screen.dart';
import '../widgets/section_title.dart';
import '../widgets/stat_card.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static const String name = 'about-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(appBarTitle: 'Abouts',),
      body: GradientBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              //  Hero Text
              skillWaveIntro(),
              const SizedBox(height: 30),

              //  Stats Section
              Wrap(
                spacing: 15,
                runSpacing: 15,
                children: const [
                  StatCard(title: "Learners", value: "2,000+"),
                  StatCard(title: "Courses", value: "120+"),
                  StatCard(title: "Certificates", value: "1,500+"),
                  StatCard(title: "Success Rate", value: "95%"),
                ],
              ),
              const SizedBox(height: 40),

              //  Mission Section
              const SectionTitle(title: "Our Mission"),
              const SizedBox(height: 10),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: const Text(
                    "SkillWave aims to bridge the gap between education and employability by providing practical skill-based learning programs designed for real-world success.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Colors.deepPurple, height: 1.5,),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              //  Features Section
              const SectionTitle(title: "Features"),
              const SizedBox(height: 10),
              _buildFeatureItem(Icons.school, "Expert-Led Courses", "Learn from experienced mentors."),
              _buildFeatureItem(Icons.timer, "Flexible Learning", "Study at your own pace."),
              _buildFeatureItem(Icons.verified, "Certified Programs", "Boost your career profile."),
              const SizedBox(height: 30),

              //  Core Values Section
              const SectionTitle(title: "Our Core Values"),
              const SizedBox(height: 10),
              _buildValueItem("🚀", "Innovation", "Encouraging creative solutions."),
              _buildValueItem("🤝", "Collaboration", "Working together for success."),
              _buildValueItem("📚", "Continuous Learning", "Always growing and evolving."),

              const SizedBox(height: 40),

              // 🗣️ Testimonials or End Section
              Center(
                child: Text(
                  "“Learn. Grow. Achieve.”",
                  style: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                Text(description, style: const TextStyle(color: Colors.white70)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildValueItem(String emoji, String text, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 24)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                Text(subtitle, style: const TextStyle(color: Colors.white70)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget skillWaveIntro() {
    return Container(
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF3A8FF1),
            Color(0xFF0062FF),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(75),
            blurRadius: 20,
            spreadRadius: 2,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LogoScreen(),
          SizedBox(height: 16),
          Text(
            "SkillWave is a modern learning platform designed to make quality education accessible to everyone. "
                "We offer a flexible and innovative learning framework that empowers learners to gain in-demand skills "
                "and achieve their career goals with confidence.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.white70, height: 1.5,),
          ),
        ],
      ),
    );
  }

}
