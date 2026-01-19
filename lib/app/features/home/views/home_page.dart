import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../providers/home_provider.dart';
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
          // Navbar
          _buildNavbar(isMobile, scrollTo, aboutKey, skillsKey, expKey, projectsKey, contactKey),

          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  _buildHeroSection(isMobile, scrollTo, contactKey),
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

  // --- Navbar ---
  Widget _buildNavbar(bool isMobile, Function scrollTo, GlobalKey about, GlobalKey skills, GlobalKey exp, GlobalKey projects, GlobalKey contact) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
      color: Colors.black.withOpacity(0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('MASUM.', style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
          if (!isMobile)
            Row(
              children: [
                _navBtn("About", () => scrollTo(about)),
                _navBtn("Skills", () => scrollTo(skills)),
                _navBtn("Experience", () => scrollTo(exp)),
                _navBtn("Projects", () => scrollTo(projects)),
                SizedBox(width: 20.w),
                ElevatedButton(onPressed: () => scrollTo(contact), child: const Text("Contact Me")),
              ],
            )
          else
            const Icon(Icons.menu),
        ],
      ),
    );
  }

  Widget _navBtn(String t, VoidCallback onTap) => TextButton(onPressed: onTap, child: Text(t, style: const TextStyle(color: Colors.white70)));

  // --- Hero Section ---
  Widget _buildHeroSection(bool isMobile, Function scrollTo, GlobalKey contact) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20.w : 100.w, vertical: 100.h),
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        children: [
          Expanded(
            flex: isMobile ? 0 : 1,
            child: Column(
              crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
              children: [
                Text("SOFTWARE ENGINEER", style: TextStyle(letterSpacing: 4, color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 14.sp)),
                SizedBox(height: 20.h),
                Text("Mobile Application Developer (Flutter)", style: TextStyle(fontSize: isMobile ? 30.sp : 50.sp, fontWeight: FontWeight.w900)),
                SizedBox(height: 20.h),
                Text("2 Years, 4 Days of professional experience in building 10+ high-quality mobile apps.", style: TextStyle(fontSize: 18.sp, color: Colors.grey)),
                SizedBox(height: 40.h),
                ElevatedButton(onPressed: () => scrollTo(contact), child: const Text("Hire Me")),
              ],
            ),
          ),
          if (!isMobile) SizedBox(width: 50.w),
          CircleAvatar(radius: 130.r, backgroundColor: Colors.blueAccent),
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
      child: Column(children: [
        Text("About Me", style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold)),
        SizedBox(height: 20.h),
        Text("I am Md. Masum Rana, a Flutter expert. I love clean code and pixel-perfect UI.", textAlign: TextAlign.center, style: TextStyle(fontSize: 18.sp, color: Colors.grey)),
      ]),
    );
  }

  // --- Skills ---
  Widget _buildSkillsSection(GlobalKey key, bool isMobile) {
    final skills = ['Flutter', 'Dart', 'Firebase', 'GetX', 'Bloc', 'Rest API', 'Git', 'Clean Architecture'];
    return Container(
      key: key,
      padding: EdgeInsets.symmetric(vertical: 80.h),
      child: Column(children: [
        Text("My Skills", style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold)),
        SizedBox(height: 30.h),
        Wrap(
          spacing: 20.w, runSpacing: 20.h,
          children: skills.map((s) => Chip(label: Text(s), backgroundColor: const Color(0xFF1E293B))).toList(),
        ),
      ]),
    );
  }

  // --- Experience ---
  Widget _buildExperienceSection(GlobalKey key, bool isMobile) {
    return Container(
      key: key,
      padding: EdgeInsets.all(80.r),
      child: Column(children: [
        Text("Experience", style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold)),
        SizedBox(height: 40.h),
        _expTile("Senior Flutter Developer", "Company A", "Present"),
        _expTile("Software Engineer", "Company B", "1 Year"),
        _expTile("Junior Developer", "Company C", "6 Months"),
      ]),
    );
  }

  // --- Projects ---
  Widget _buildProjectsSection(GlobalKey key, bool isMobile) {
    return Container(
      key: key,
      padding: EdgeInsets.all(80.r),
      child: Column(children: [
        Text("Selected Projects", style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold)),
        SizedBox(height: 40.h),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 2, crossAxisSpacing: 20, mainAxisSpacing: 20, childAspectRatio: 1.6
          ),
          itemCount: 4,
          itemBuilder: (context, i) => Container(
            decoration: BoxDecoration(color: const Color(0xFF161B22), borderRadius: BorderRadius.circular(15)),
            child: Center(child: Text("Project ${i+1}", style: const TextStyle(fontSize: 20))),
          ),
        ),
      ]),
    );
  }

  // --- Contact ---
  Widget _buildContactSection(GlobalKey key, bool isMobile) {
    return Container(
      key: key,
      padding: EdgeInsets.all(80.r),
      width: double.infinity,
      color: Colors.blueAccent.withOpacity(0.1),
      child: Column(children: [
        Text("Get In Touch", style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold)),
        SizedBox(height: 20.h),
        Text("Email: masumrana@example.com", style: TextStyle(fontSize: 20.sp)),
        SizedBox(height: 20.h),
        ElevatedButton(onPressed: () {}, child: const Text("Send Message")),
      ]),
    );
  }

  Widget _buildFooter() => Padding(padding: EdgeInsets.all(40.r), child: const Text("© 2026 Md. Masum Rana"));

  Widget _expTile(String r, String c, String d) => Container(
    margin: EdgeInsets.only(bottom: 20.h),
    padding: EdgeInsets.all(20.r),
    decoration: BoxDecoration(color: const Color(0xFF161B22), borderRadius: BorderRadius.circular(10)),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(r, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.blueAccent)),
        Text(c, style: const TextStyle(color: Colors.grey)),
      ]),
      Text(d),
    ]),
  );
}
