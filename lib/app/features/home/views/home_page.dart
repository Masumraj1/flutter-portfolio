import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../providers/scroll_controller_provider.dart';
import '../widgets/custom_nav_bar.dart';
import '../widgets/hero_section.dart';
import '../widgets/sections.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = ref.watch(scrollControllerProvider);
    final isMobile = MediaQuery.of(context).size.width < 768;

    // Keys for Scrolling
    final aboutKey = GlobalKey();
    final skillsKey = GlobalKey();
    final expKey = GlobalKey();
    final projectsKey = GlobalKey();
    final contactKey = GlobalKey();

    void scrollTo(GlobalKey key) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }

    return Scaffold(
      body: Column(
        children: [
          // ===========>>Navbar <<=============
          CustomNavbar(
            isMobile: isMobile,
            scrollTo: scrollTo,
            aboutKey: aboutKey,
            skillsKey: skillsKey,
            expKey: expKey,
            projectsKey: projectsKey,
            contactKey: contactKey,
          ),


          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [

                  //============Hero Section===========
                  HeroSection(
                    isMobile: isMobile,
                    scrollTo: scrollTo,
                    contactKey: contactKey,
                  ),
                  _buildStatsSection(isMobile),
                  _buildAboutSection(aboutKey, isMobile),
                  _buildSkillsSection(skillsKey, isMobile),
                  _buildExperienceSection(expKey, isMobile),
                  _buildProjectsSection(projectsKey, isMobile),
                  _buildContactSection(contactKey, isMobile),
                  _buildFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }





  // --- Stats ---
  Widget _buildStatsSection(bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 60.h),
      color: Colors.white.withOpacity(0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          StatCard("2+", "Years Exp"),
          StatCard("10+", "Projects"),
          StatCard("3", "Companies"),
        ],
      ),
    );
  }

  // --- About ---
  Widget _buildAboutSection(GlobalKey key, bool isMobile) {
    return Container(
      key: key,
      padding: EdgeInsets.all(80.r),
      child: Column(
        children: [
          Text(
            "About Me",
            style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.h),
          Text(
            "I am Md. Masum Rana, a Flutter expert. I love clean code and pixel-perfect UI.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.sp, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // --- Skills ---
  Widget _buildSkillsSection(GlobalKey key, bool isMobile) {
    final skills = [
      'Flutter',
      'Dart',
      'Firebase',
      'GetX',
      'Bloc',
      'Rest API',
      'Git',
      'Clean Architecture',
    ];
    return Container(
      key: key,
      padding: EdgeInsets.symmetric(vertical: 80.h),
      child: Column(
        children: [
          Text(
            "My Skills",
            style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30.h),
          Wrap(
            spacing: 20.w,
            runSpacing: 20.h,
            children: skills
                .map(
                  (s) => Chip(
                    label: Text(s),
                    backgroundColor: const Color(0xFF1E293B),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  // --- Experience ---
  Widget _buildExperienceSection(GlobalKey key, bool isMobile) {
    return Container(
      key: key,
      padding: EdgeInsets.all(80.r),
      child: Column(
        children: [
          Text(
            "Experience",
            style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 40.h),
          _expTile("Senior Flutter Developer", "Company A", "Present"),
          _expTile("Software Engineer", "Company B", "1 Year"),
          _expTile("Junior Developer", "Company C", "6 Months"),
        ],
      ),
    );
  }

  // --- Projects ---
  Widget _buildProjectsSection(GlobalKey key, bool isMobile) {
    return Container(
      key: key,
      padding: EdgeInsets.all(80.r),
      child: Column(
        children: [
          Text(
            "Selected Projects",
            style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 40.h),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1.6,
            ),
            itemCount: 4,
            itemBuilder: (context, i) => Container(
              decoration: BoxDecoration(
                color: const Color(0xFF161B22),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  "Project ${i + 1}",
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- Contact ---
  Widget _buildContactSection(GlobalKey key, bool isMobile) {
    return Container(
      key: key,
      padding: EdgeInsets.all(80.r),
      width: double.infinity,
      color: Colors.blueAccent.withOpacity(0.1),
      child: Column(
        children: [
          Text(
            "Get In Touch",
            style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.h),
          Text(
            "Email: masumrana@example.com",
            style: TextStyle(fontSize: 20.sp),
          ),
          SizedBox(height: 20.h),
          ElevatedButton(onPressed: () {}, child: const Text("Send Message")),
        ],
      ),
    );
  }

  Widget _buildFooter() => Padding(
    padding: EdgeInsets.all(40.r),
    child: const Text("© 2026 Md. Masum Rana"),
  );

  Widget _expTile(String r, String c, String d) => Container(
    margin: EdgeInsets.only(bottom: 20.h),
    padding: EdgeInsets.all(20.r),
    decoration: BoxDecoration(
      color: const Color(0xFF161B22),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              r,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.blueAccent,
              ),
            ),
            Text(c, style: const TextStyle(color: Colors.grey)),
          ],
        ),
        Text(d),
      ],
    ),
  );
}
