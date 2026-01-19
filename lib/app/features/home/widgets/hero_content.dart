import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeroContent extends StatelessWidget {
  final bool isMobile;
  final VoidCallback onHireMeTap;

  const HeroContent({
    super.key,
    required this.isMobile,
    required this.onHireMeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          "SOFTWARE ENGINEER",
          style: TextStyle(
            letterSpacing: 4,
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
          ),
        ),
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
          "2 Years, 4 Days of professional experience in building 10+ high-quality mobile apps.",
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: TextStyle(fontSize: 18.sp, color: Colors.grey),
        ),
        SizedBox(height: 40.h),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
          ),
          onPressed: onHireMeTap,
          child: const Text("Hire Me"),
        ),
      ],
    );
  }
}