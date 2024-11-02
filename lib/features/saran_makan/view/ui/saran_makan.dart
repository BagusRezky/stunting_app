import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stunting_app/features/saran_makan/controllers/saran_controller.dart';
import 'package:stunting_app/shared/styles/color_style.dart';
import 'package:stunting_app/shared/styles/google_text_style.dart';
import 'package:stunting_app/shared/widgets/custom_button.dart';
import 'package:stunting_app/shared/widgets/custom_fields.dart';

class SaranMakanScreen extends StatelessWidget {
  SaranMakanScreen({super.key});
  final SaranController _saranController = Get.put(SaranController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.white,
      appBar: AppBar(
        backgroundColor: ColorStyle.white,
        centerTitle: true,
        title: const Text('Saran Makan'),
        titleTextStyle: GoogleTextStyle.fw600
            .copyWith(color: ColorStyle.dark, fontSize: 17.sp),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              CustomFieldContainer(
                label: Text(
                  'Budget',
                  style: GoogleTextStyle.fw600
                      .copyWith(color: ColorStyle.dark, fontSize: 14.sp),
                ),
                child: TextField(
                  onChanged: _saranController.setBudget,
                  decoration: InputDecoration(
                    hintText: "Enter your budget",
                    hintStyle: GoogleTextStyle.fw200
                        .copyWith(color: ColorStyle.dark, fontSize: 14.sp),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              CustomFieldContainer(
                label: Text(
                  'Jumlah Hari',
                  style: GoogleTextStyle.fw600
                      .copyWith(color: ColorStyle.dark, fontSize: 14.sp),
                ),
                child: TextField(
                  onChanged: _saranController.setDays,
                  decoration: InputDecoration(
                    hintText: "Enter number of days",
                    hintStyle: GoogleTextStyle.fw200
                        .copyWith(color: ColorStyle.dark, fontSize: 14.sp),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              CustomButton(
                onPressed: () async {
                  await _saranController.generateSaranMakan();
                },
                text: 'Generate Saran Makan',
                backgroundColor: ColorStyle.primary,
                textStyle: GoogleTextStyle.fw500.copyWith(
                  color: ColorStyle.white,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(height: 20.h),
              Obx(() {
                // Menampilkan hasil di dalam Container dengan format Markdown
                return Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: ColorStyle.disable,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ColorStyle.dark.withOpacity(0.5)),
                  ),
                  child: MarkdownBody(
                    data: _saranController.result.value.isEmpty
                        ? 'Hasil akan muncul di sini'
                        : _saranController.result.value,
                    styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context))
                        .copyWith(
                      // a: GoogleTextStyle.fw600.copyWith(
                      //   color: ColorStyle.dark,
                      //   fontSize: 14.sp,
                      // ),
                      p: GoogleTextStyle.fw500.copyWith(
                        color: ColorStyle.dark,
                        fontSize: 14.sp,
                      ),
                    ),
                    selectable: true, // Optional: Allows text selection
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
