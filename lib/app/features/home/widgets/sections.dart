import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatCard extends StatelessWidget {
  final String v, l;
  const StatCard(this.v, this.l, {super.key});
  @override
  Widget build(BuildContext context) => Column(children: [
    Text(v, style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
    Text(l, style: const TextStyle(color: Colors.grey)),
  ]);
}