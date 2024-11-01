import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stunting_app/shared/styles/color_style.dart';

class CustomFieldContainer extends StatelessWidget {
  final Widget child;
  final Text? label;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final double? borderRadius;
  final BoxBorder? border;

  const CustomFieldContainer({
    super.key,
    required this.child,
    this.label,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.borderRadius = 8.0,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label ?? const Text(''),
        Container(
          padding: padding ?? EdgeInsets.all(1.w),
          margin: margin ?? const EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
            color: backgroundColor ?? ColorStyle.disable,
            borderRadius: BorderRadius.circular(borderRadius!),
            border: border ?? Border.all(color: ColorStyle.dark),
          ),
          child: child,
        ),
      ],
    );
  }
}
