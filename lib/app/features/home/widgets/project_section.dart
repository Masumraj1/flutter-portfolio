import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'project_card.dart';

class ProjectsSection extends StatelessWidget {
  final GlobalKey sectionKey;
  final bool isMobile;

  const ProjectsSection({
    super.key,
    required this.sectionKey,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> projects = [
      {
        'title': 'E-Commerce App',
        'desc': 'Full-stack app with GetX and Firebase.',
        'image': 'https://via.placeholder.com/400x300',
        'tech': ['Flutter', 'Firebase', 'GetX']
      },
      {
        'title': 'Task Manager',
        'desc': 'Productivity tool with local database.',
        'image': 'https://via.placeholder.com/400x300',
        'tech': ['Flutter', 'Hive', 'Bloc']
      },
      {
        'title': 'Weather Forecast',
        'desc': 'Real-time weather updates using OpenWeather API.',
        'image': 'https://via.placeholder.com/400x300',
        'tech': ['Dart', 'Rest API']
      },
      {
        'title': 'Portfolio Website',
        'desc': 'Responsive web portfolio built with Flutter.',
        'image': 'https://via.placeholder.com/400x300',
        'tech': ['Flutter Web', 'Riverpod']
      },
    ];

    return Container(
      key: sectionKey,
      padding: EdgeInsets.symmetric(
        vertical: 80.h,
        horizontal: isMobile ? 20.w : 100.w,
      ),
      child: Column(
        children: [
          Text(
            "Selected Projects",
            style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.h),
          Container(width: 40.w, height: 3.h, color: Colors.blueAccent),
          SizedBox(height: 50.h),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: projects.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 2,
              crossAxisSpacing: 30.w,
              mainAxisSpacing: 30.h,
              childAspectRatio: 1.5,
            ),
            itemBuilder: (context, i) {
              final p = projects[i];
              return ProjectCard(
                title: p['title'],
                description: p['desc'],
                imageUrl: p['image'],
                techStack: p['tech'],
              );
            },
          ),
        ],
      ),
    );
  }
}