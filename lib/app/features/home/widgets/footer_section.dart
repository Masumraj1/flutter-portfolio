import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/scroll_controller_provider.dart';

class FooterSection extends ConsumerWidget {
  const FooterSection({super.key});

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = ref.watch(scrollControllerProvider);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 20.w),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.white.withValues(alpha: 0.05)),
        ),
      ),
      child: Column(
        children: [
          /// Social Icons
        Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _socialSvgIcon(
            asset: 'assets/icons/linkedin.svg',
            tooltip: 'LinkedIn',
            onTap: () {
              _openUrl('https://www.linkedin.com/in/flutterapp/');
            },
          ),
          _socialSvgIcon(
            asset: 'assets/icons/github_new.svg',
            tooltip: 'GitHub',
            onTap: () {
              _openUrl('https://github.com/Masumraj1');
            },
          ),
          _socialSvgIcon(
            asset: 'assets/icons/facebook.svg',
            tooltip: 'Facebook',
            onTap: () {
              _openUrl('https://www.facebook.com/sadibestu/');
            },
          ),
        ],
      ),

          SizedBox(height: 24.h),

          /// Copyright
          Text(
            "© 2026 Md. Masum Rana. All Rights Reserved.",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14.sp,
            ),
          ),

          SizedBox(height: 14.h),

          /// Back to Top
          TextButton.icon(
            onPressed: () {
              scrollController.animateTo(
                0,
                duration: const Duration(milliseconds: 900),
                curve: Curves.easeInOut,
              );
            },
            icon: Icon(
              Icons.arrow_upward_rounded,
              size: 16.sp,
              color: Colors.blueAccent,
            ),
            label: Text(
              "Back to Top",
              style: TextStyle(
                color: Colors.blueAccent,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// SVG Social Icon Widget
  Widget _socialSvgIcon({
    required String asset,
    required String tooltip,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Tooltip(
        message: tooltip,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14.r),
          child: Container(
            width: 50.w,
            height: 50.w,
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.r),
              color: Colors.white.withValues(alpha: 0.03),
            ),
            child: SvgPicture.asset(
              asset,
              fit: BoxFit.contain,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
