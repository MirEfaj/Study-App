// lib/models/course_model.dart

class Course {
  final int id;
  final String title;
  final String description;
  final String lessons;
  final String duration;
  final String image;
  final List<String> videos;
  final List<String> webpages;

  const Course({
    required this.id,
    required this.title,
    required this.description,
    required this.lessons,
    required this.duration,
    required this.image,
    required this.videos,
    required this.webpages,
  });
}
