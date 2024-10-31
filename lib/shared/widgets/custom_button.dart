import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stunting_app/shared/styles/color_style.dart';
import 'package:stunting_app/shared/styles/google_text_style.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final TextStyle? textStyle;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.height,
    this.width,
    this.backgroundColor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50.h,
      width: width ?? double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? ColorStyle.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyle ??
              GoogleTextStyle.fw500.copyWith(
                color: ColorStyle.white,
                fontSize: 16.sp,
              ),
        ),
      ),
    );
  }
}
