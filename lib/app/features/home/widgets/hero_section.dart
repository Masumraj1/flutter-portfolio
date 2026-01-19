import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'hero_content.dart';

class HeroSection extends StatelessWidget {
  final bool isMobile;
  final Function(GlobalKey) scrollTo;
  final GlobalKey contactKey;

  const HeroSection({
    super.key,
    required this.isMobile,
    required this.scrollTo,
    required this.contactKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20.w : 100.w,
        vertical: 100.h,
      ),
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Side / Top Side: Text Content
          Expanded(
            flex: isMobile ? 0 : 1,
            child: HeroContent(
              isMobile: isMobile,
              onHireMeTap: () => scrollTo(contactKey),
            ),
          ),

          if (!isMobile) SizedBox(width: 50.w),

          // Right Side / Bottom Side: Profile Image
          _buildProfileImage(),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return Padding(
      padding: EdgeInsets.only(top: isMobile ? 50.h : 0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background Glow Effect
          Container(
            width: isMobile ? 220.r : 280.r,
            height: isMobile ? 220.r : 280.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.blueAccent.withValues(alpha: 0.2),
                  blurRadius: 50,
                  spreadRadius: 10,
                ),
              ],
            ),
          ),
          CircleAvatar(
            radius: isMobile ? 110.r : 140.r,
            backgroundColor: Colors.blueAccent,
            child: CircleAvatar(
              radius: isMobile ? 105.r : 135.r,
              backgroundImage: const NetworkImage('https://via.placeholder.com/300'),
            ),
          ),
        ],
      ),
    );
  }
}