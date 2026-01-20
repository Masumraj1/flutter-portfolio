import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'stat_card.dart';

class StatsSection extends StatelessWidget {
  final bool isMobile;

  const StatsSection({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 60.h),
      // Modern Subtle Background
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.02),
        border: Border.symmetric(
          horizontal: BorderSide(color: Colors.white.withValues(alpha: 0.05)),
        ),
      ),
      child: isMobile
          ? Column(
        children: _buildItems(),
      )
          : Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _buildItems(),
      ),
    );
  }

  List<Widget> _buildItems() {
    return [
      const StatCard(value: "2+", label: "Years Job Exp"),
      if (isMobile) SizedBox(height: 40.h),
      const StatCard(value: "1+", label: "Years Self Learning"),
      if (isMobile) SizedBox(height: 40.h),
      const StatCard(value: "15+", label: "Projects"),
      if (isMobile) SizedBox(height: 40.h),
      const StatCard(value: "3", label: "Companies"),
    ];
  }
}