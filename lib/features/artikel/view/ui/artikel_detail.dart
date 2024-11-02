import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stunting_app/shared/styles/color_style.dart';
import 'package:stunting_app/shared/styles/google_text_style.dart';
// import 'package:flutter_html/flutter_html.dart';
class ArtikelDetailScreen extends StatelessWidget {
  final Map<String, dynamic> artikel;

  const ArtikelDetailScreen({
    super.key,
    required this.artikel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
        title: Text(artikel['category_name'] ?? ''),
        titleTextStyle: GoogleTextStyle.fw600
            .copyWith(color: ColorStyle.dark, fontSize: 17.sp),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                artikel['title'] ?? '',
                style: GoogleTextStyle.fw700.copyWith(
                  color: ColorStyle.dark,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                DateFormat('dd MMMM yyyy')
                    .format(DateTime.parse(artikel['created_at'])),
                style: GoogleTextStyle.fw400.copyWith(
                  color: Colors.grey[600],
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 20.h),
              // Html(
              //   data: artikel['content'] ?? '',
              //   style: {
              //     "body": Style(
              //       fontSize: FontSize(14.sp),
              //       lineHeight: LineHeight(1.5),
              //     ),
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}