import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stunting_app/shared/styles/color_style.dart';
import 'package:stunting_app/shared/styles/google_text_style.dart';

class ArtikelCard extends StatelessWidget {
  final Map<String, dynamic> artikel;
  final VoidCallback onTap;

  const ArtikelCard({
    super.key,
    required this.artikel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 10.h),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: EdgeInsets.all(15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                artikel['title'] ?? '',
                style: GoogleTextStyle.fw600.copyWith(
                  color: ColorStyle.dark,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                'Kategori: ${artikel['category_name'] ?? ''}',
                style: GoogleTextStyle.fw400.copyWith(
                  color: Colors.grey[600],
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                'Tanggal: ${DateFormat('dd MMMM yyyy').format(DateTime.parse(artikel['created_at']))}',
                style: GoogleTextStyle.fw400.copyWith(
                  color: Colors.grey[600],
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
