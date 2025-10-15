import 'package:flutter/material.dart';
import '../widgets/appBar.dart';
import '../widgets/gradient_background.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  static const String name = 'dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(appBarTitle: 'Dashboard',),
      body: GradientBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              _buildHeader(),

              const SizedBox(height: 20),

              //  Top Features
              _buildSectionTitle("Learning Dashboard", showMore: true),
              const SizedBox(height: 10),
              _buildFeatureGrid([
                _buildFeatureItem(Icons.menu_book, "Course Syllabus"),
                _buildFeatureItem(Icons.play_circle, "Video Lessons"),
                _buildFeatureItem(Icons.analytics_outlined, "Study Metrics"),
                _buildFeatureItem(Icons.quiz_outlined, "Practice Tests"),
                _buildFeatureItem(Icons.workspace_premium, "My Certificates"),
                _buildFeatureItem(Icons.web, "Webpage Tutorials"),
              ]),

              const SizedBox(height: 20),

              //  Study Resources
              _buildSectionTitle("Study Resources", showMore: true),
              const SizedBox(height: 10),
              _buildFeatureGrid([
                _buildFeatureItem(Icons.update, "New Updates"),
                _buildFeatureItem(Icons.lightbulb_outline, "Important Facts"),
                _buildFeatureItem(Icons.bookmark_outline, "Saved Content"),
              ]),

              const SizedBox(height: 20),

              //  Community & Premium
              _buildSectionTitle("Community & Premium", showMore: true),
              const SizedBox(height: 10),
              _buildFeatureGrid([
                _buildFeatureItem(Icons.group, "Study Groups"),
                _buildFeatureItem(Icons.star, "Premium"),
                _buildFeatureItem(Icons.tips_and_updates, "Tips & Tricks"),
              ]),

              const SizedBox(height: 20),

              //  Enrolled Courses
              _buildSectionTitle("My Enrolled Courses", showMore: false),
              const SizedBox(height: 10),
              _buildEnrolledCard(),

              const SizedBox(height: 20),

              //  Weekly Goal Progress
              _buildWeeklyGoal(),

              const SizedBox(height: 15),

              //  Streak Banner
              _buildStreakBanner(),
            ],
          ),
        ),
      ),
    );
  }

  //  Top Header Section
  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xffd448e8), Color(0xffb13cff)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "SkillWave Learning Hub",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                "Welcome back, keep learning!",
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(51),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.notifications_none, color: Colors.white),
          )
        ],
      ),
    );
  }

  //  Section Title
  Widget _buildSectionTitle(String title, {bool showMore = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
        if (showMore)
          TextButton(
            onPressed: () {},
            child: const Text("View more", style: TextStyle(color: Colors.white),),
          )
      ],
    );
  }

  //  Feature Grid
  Widget _buildFeatureGrid(List<Widget> children) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 1,
      children: children,
    );
  }

  //  Feature Item
  Widget _buildFeatureItem(IconData icon, String label) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: const Offset(1, 2),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: const Color(0xff9100ff), size: 28),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  //  Enrolled Card
  Widget _buildEnrolledCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          const Icon(Icons.menu_book, size: 50, color: Color(0xff9100ff)),
          const SizedBox(height: 10),
          const Text(
            "No enrolled courses yet",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 6),
          const Text(
            "Start your learning journey today",
            style: TextStyle(color: Colors.black54, fontSize: 12),
          ),
          const SizedBox(height: 14),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff9100ff),
              padding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () {},
            child: const Text("Browse Courses",
                style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  //  Weekly Goal Progress
  Widget _buildWeeklyGoal() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: const Offset(1, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Weekly Goal",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("6.2 / 10 hours", style: TextStyle(fontSize: 13)),
              Text("4.8 h to go", style: TextStyle(fontSize: 13)),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: 0.62,
              backgroundColor: Colors.grey[200],
              color: const Color(0xff9100ff),
              minHeight: 10,
            ),
          ),
        ],
      ),
    );
  }

  //  Streak Banner
  Widget _buildStreakBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xffff7a00), Color(0xffff5100)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Center(
        child: Text(
          "🔥 12 Day Learning Streak!",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
    );
  }
}

