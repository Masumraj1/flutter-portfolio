import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_network_image.dart';
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
          // ১. Background Glow Effect
          Container(
            width: isMobile ? 240.r : 300.r,
            height: isMobile ? 240.r : 300.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.blueAccent.withValues(alpha: 0.2),
                  blurRadius: 50,
                  spreadRadius: 15,
                ),
              ],
            ),
          ),

          // ২. Blue Border Ring (CustomNetworkImage এর বাইরে থাকবে)
          Container(
            padding: EdgeInsets.all(5.r), // বর্ডারের গুরুত্ব বা থিকনেস
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
              shape: BoxShape.circle,
            ),
            child: CustomNetworkImage(
              imageUrl: 'https://avatars.githubusercontent.com/u/141552007?v=4', // আপনার ছবি এখানে দিন
              height: isMobile ? 210.r : 270.r,
              width: isMobile ? 210.r : 270.r,
              boxShape: BoxShape.circle,
              backgroundColor: const Color(0xFF161B22), // লোডিং বা এররের সময় কালার
            ),
          ),
        ],
      ),
    );
  }
}