import 'package:flutter/material.dart';
import '../widgets/appBar.dart';
import '../widgets/app_drawer.dart';
import '../widgets/gradient_background.dart';
import '../widgets/video_page.dart';
import '../widgets/web_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String name = "home- page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = '';

  final List<Map<String, dynamic>> courses = const [
    {
      'title': 'Flutter Development',
      'description':
      'Build beautiful cross-platform mobile apps with Flutter and Dart',
      'lessons': '42 lessons',
      'duration': '12 hours',
      'image':
      'https://i.ytimg.com/vi/CzRQ9mnmh44/maxresdefault.jpg'
    },
    {
      'title': 'Python Programming',
      'description':
      'Master Python from basics to advanced concepts and build real projects',
      'lessons': '38 lessons',
      'duration': '10 hours',
      'image':
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAVs3_JJYZ0OYWfWS-YJjWnytd7sUr_nTA6w&s'
    },
    {
      'title': 'UI/UX Design',
      'description':
      'Learn user interface and experience design principles and tools',
      'lessons': '28 lessons',
      'duration': '8 hours',
      'image':
      'https://img.freepik.com/free-vector/gradient-ui-ux-background_23-2149052117.jpg?semt=ais_hybrid&w=740&q=80'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredCourses = courses
        .where((course) => course['title']
        .toString()
        .toLowerCase()
        .contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(appBarTitle: "Skill-Wave"),
      drawer: AppDrawer(),
      body: GradientBackground(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // 🔍 Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
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
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 8),
            const Text(
              "Choose a course and start learning today",
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            const SizedBox(height: 20),

            // 📚 Course List
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

  Widget buildCourseCard(BuildContext context, Map<String, dynamic> course) {
    return GestureDetector(
      onTap: () => _showLearningFormatDialog(context, course['title']),
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
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
              child: Image.network(
                course['image'],
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course['title'],
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    course['description'],
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.menu_book,
                              color: Colors.white70, size: 18),
                          const SizedBox(width: 5),
                          Text(course['lessons'],
                              style:
                              const TextStyle(color: Colors.white70)),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.access_time,
                              color: Colors.white70, size: 18),
                          const SizedBox(width: 5),
                          Text(course['duration'],
                              style:
                              const TextStyle(color: Colors.white70)),
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

  void _showLearningFormatDialog(BuildContext context, String courseTitle) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)),
          title: const Text(
            'Choose Learning Format',
          ),
          content: Text(courseTitle),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const VideoPage()),
                    );
                  },
                  icon: const Icon(Icons.play_circle_fill),
                  label: const Text("Video"),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purpleAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const WebPage()),
                    );
                  },
                  icon: const Icon(Icons.language),
                  label: const Text("Webpage"),
                ),
              ],
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            )
          ],
        );
      },
    );
  }
}
