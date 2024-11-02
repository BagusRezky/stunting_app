import 'package:flutter/material.dart';
import 'package:stunting_app/shared/styles/color_style.dart';
import 'package:stunting_app/shared/styles/google_text_style.dart';

class CardContainer extends StatelessWidget {
  final String? date;
  final String? label;
  final String? value;
  final Color? textColor;

  const CardContainer({
    super.key,
    this.date,
    this.label,
    this.value,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: ColorStyle.light,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date ?? '00/00/0000',
            style: GoogleTextStyle.fw400.copyWith(color: ColorStyle.secondary),
          ),
          const SizedBox(height: 4),
          Text(
            label ?? 'tidak ada data',
            style: GoogleTextStyle.fw600.copyWith(
              fontSize: 20,
              color: textColor ?? ColorStyle.dark,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value ?? 'tidak ada data',
            style: GoogleTextStyle.fw700.copyWith(
              fontSize: 24,
              color: ColorStyle.dark,
            ),
          ),
        ],
      ),
    );
  }
}
