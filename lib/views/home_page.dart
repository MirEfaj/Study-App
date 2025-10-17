import 'dart:ui';
import 'package:flutter/material.dart';

import '../models/course_model.dart';
import '../utils/courses_data.dart';
import '../widgets/appBar.dart';
import '../widgets/app_drawer.dart';
import '../widgets/gradient_background.dart';
import '../widgets/video_page.dart';
import '../widgets/web_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String name = "home-page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredCourses = courses
        .where((course) => course.title.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(appBarTitle: "Skill-Wave"),
      drawer: AppDrawer(),
      body: GradientBackground(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(25),
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  icon: const Icon(Icons.search, color: Colors.white70),
                  hintText: 'Search courses...',
                  hintStyle: const TextStyle(color: Colors.white54),
                  border: InputBorder.none,
                  suffixIcon: searchQuery.isNotEmpty
                      ? IconButton(
                    icon: const Icon(Icons.clear, color: Colors.white70),
                    onPressed: () {
                      _searchController.clear();
                      setState(() {
                        searchQuery = '';
                      });
                    },
                  )
                      : null,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Explore Courses",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 8),
            const Text(
              "Choose a course and start learning today",
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            const SizedBox(height: 20),

            // Course List
            if (filteredCourses.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: Text(
                    'No courses found',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ),
              )
            else
              ...filteredCourses.map((course) => buildCourseCard(context, course)),
          ],
        ),
      ),
    );
  }

  Widget buildCourseCard(BuildContext context, Course course) {
    return GestureDetector(
      onTap: () => _showLearningFormatDialog(context, course),
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(51),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 180,
              width: double.infinity,
              child: Image.network(course.image, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.title,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const SizedBox(height: 8),
                  Text(course.description, style: const TextStyle(color: Colors.black, fontSize: 14)),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.menu_book, color: Colors.indigoAccent, size: 18),
                          const SizedBox(width: 5),
                          Text(course.lessons, style: const TextStyle(color: Colors.black)),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.access_time, color: Colors.green, size: 18),
                          const SizedBox(width: 5),
                          Text(course.duration, style: const TextStyle(color: Colors.green)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showLearningFormatDialog(BuildContext context, Course course) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withAlpha(51),
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: AlertDialog(
            backgroundColor: Colors.grey.withAlpha(140),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(color: Colors.white, width: 3),
            ),
            title: const Text(
              'Choose Learning Format',
              style: TextStyle(color: Colors.cyanAccent, fontWeight: FontWeight.bold, fontSize: 25),
            ),
            content: Text(
              course.title,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purpleAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(color: Colors.white, width: 2),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => VideoPage(title: course.title, videoUrls: course.videos),
                          ),
                        );
                      },
                      icon: const Icon(Icons.play_circle_fill, size: 30, color: Colors.white),
                      label: const Text("Video", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                    ),
                    const SizedBox(width: 5,),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purpleAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(color: Colors.white, width: 2),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => WebPage(title: course.title, webpageUrls: course.webpages),
                          ),
                        );
                      },
                      icon: const Icon(Icons.language, size: 30, color: Colors.white),
                      label: const Text("Webpage", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel", style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ],
          ),
        );
      },
    );
  }
}
