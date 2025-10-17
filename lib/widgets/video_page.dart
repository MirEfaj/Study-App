import 'package:flutter/material.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Python Programming', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text('Video Tutorial', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black,),),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Introduction and Setup', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
                  SizedBox(height: 8),
                  Text('Duration: 12:30', style: TextStyle(color: Colors.grey,),),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('Introduction and Setup', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),),
            const SizedBox(height: 8),
            const Text(
              'Learn the fundamentals and build a strong foundation for this course.',
              style: TextStyle(color: Colors.grey,),),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text('Course Progress'),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text('2 of 6 lessons', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold,),),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text('Course Lessons', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),),
            const SizedBox(height: 16),
            _buildLessonItem('Lesson 1', 'Introduction and Setup', '12:30'),
            _buildLessonItem('Lesson 2', 'Basic Concepts', '18:45'),
            _buildLessonItem('Lesson 3', 'Working with Components', '25:15'),
            _buildLessonItem('Lesson 4', 'State Management', '22:10'),
          ],
        ),
      ),
    );
  }

  Widget _buildLessonItem(String lessonNumber, String title, String duration) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(lessonNumber, style: const TextStyle(fontWeight: FontWeight.bold,),),
              const SizedBox(height: 4),
              Text(title, style: const TextStyle(fontSize: 16,),),
            ],
          ),
          Text(duration, style: const TextStyle(color: Colors.grey,),),
        ],
      ),
    );
  }
}