// lib/utils/courses_data.dart

import '../models/course_model.dart';

const List<Course> courses = [
  Course(
    id: 1,
    title: 'Flutter Development',
    description: 'Build beautiful cross-platform mobile apps with Flutter and Dart',
    lessons: '42 lessons',
    duration: '12 hours',
    image: 'https://i.ytimg.com/vi/CzRQ9mnmh44/maxresdefault.jpg',
    videos: [
      'https://www.youtube.com/embed/1xipg02Wu8s',
      'https://www.youtube.com/embed/3kaGC_DrUnw',
      'https://www.youtube.com/embed/TclK5gNM_PM',
    ],
    webpages: [
      'https://flutter.dev/docs',
      'https://dart.dev/guides',
    ],
  ),
  Course(
    id: 2,
    title: 'Python Programming',
    description: 'Master Python from basics to advanced concepts and build real projects',
    lessons: '38 lessons',
    duration: '10 hours',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAVs3_JJYZ0OYWfWS-YJjWnytd7sUr_nTA6w&s',
    videos: [
      'https://youtu.be/python1',
      'https://youtu.be/python2',
    ],
    webpages: [
      'https://www.python.org/doc/',
      'https://realpython.com/',
    ],
  ),
  Course(
    id: 3,
    title: 'UI/UX Design',
    description: 'Learn user interface and experience design principles and tools',
    lessons: '28 lessons',
    duration: '8 hours',
    image: 'https://img.freepik.com/free-vector/gradient-ui-ux-background_23-2149052117.jpg?semt=ais_hybrid&w=740&q=80',
    videos: [
      'https://youtu.be/uiux1',
      'https://youtu.be/uiux2',
    ],
    webpages: [
      'https://www.interaction-design.org/',
      'https://uxdesign.cc/',
    ],
  ),
];
