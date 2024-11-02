import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stunting_app/shared/styles/google_text_style.dart';

class Zscore extends StatelessWidget {
  const Zscore({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Apa itu Z - Score',
            style: GoogleTextStyle.fwBold.copyWith(fontSize: 18.sp),
          ),
          SizedBox(height: 8.h),
          Text(
            'Nilai  Z - Score adalah satuan ukuran yang menentukan ambang batas dari status gizi anak dilihat berbagai indeks pengukuran yaitu BB/U, BB/PB atau BB/TB, IMT/U & LK/U. Setiap indeks pengukuran memiliki nilai Z - Score yang berbeda.',
            style: GoogleTextStyle.fw300.copyWith(fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
