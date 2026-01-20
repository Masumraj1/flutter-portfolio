import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroContent extends StatelessWidget {
  final bool isMobile;
  final VoidCallback onHireMeTap;

  const HeroContent({
    super.key,
    required this.isMobile,
    required this.onHireMeTap,
  });
  Future<void> _downloadCV() async {
    final Uri url = Uri.parse('https://drive.google.com/file/d/1qWWg7yJIbvFrKVOoDSE_mPT4gz1NAVk2/view?usp=sharing');

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [

        SizedBox(height: 20.h),
        Text(
          "Mobile Application Developer (Flutter)",
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: TextStyle(
            fontSize: isMobile ? 30.sp : 50.sp,
            fontWeight: FontWeight.w900,
            height: 1.2,
          ),
        ),
        SizedBox(height: 20.h),
        Text(
          "2 Years, 4 Days of professional experience in building 15+ high-quality mobile apps.",
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
        ),

        SizedBox(height: 40.h),
        // Button Container
        Wrap( // Wrap use korle automatically screen size onujayi row/column hoye jabe
          spacing: 20.w, // Button duitir majhe faka
          runSpacing: 15.h, // Mobile-e niche niche namle gap
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            // Hire Me Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
              ),
              onPressed: onHireMeTap,
              child: const Text("Hire Me"),
            ),

            // Download CV Button (Outline Style)
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                side: BorderSide(color: Theme.of(context).primaryColor), // Border color
              ),
              onPressed: _downloadCV,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Download CV"),
                  SizedBox(width: 8.w),
                  const Icon(Icons.download_rounded, size: 20),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}