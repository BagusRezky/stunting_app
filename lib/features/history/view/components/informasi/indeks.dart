import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stunting_app/shared/styles/google_text_style.dart';

class Indeks extends StatelessWidget {
  final String category;
  final String description;

  const Indeks({
    super.key,
    required this.category,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Indeks: $category',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            description,
            style: GoogleTextStyle.fw300.copyWith(fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
