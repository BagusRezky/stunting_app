import 'package:flutter/material.dart';
import 'package:stunting_app/features/jadwal/models/imunitation.dart';
import 'package:stunting_app/shared/styles/color_style.dart';
import 'package:stunting_app/shared/styles/google_text_style.dart';

class ImmunizationScheduleItem extends StatelessWidget {
  final ImmunizationSchedule schedule;

  const ImmunizationScheduleItem({
    super.key,
    required this.schedule,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorStyle.disable.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: ColorStyle.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.medical_services_outlined,
              color: ColorStyle.primary,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  schedule.scheduleDate,
                  style: GoogleTextStyle.fw600.copyWith(
                    fontSize: 16,
                    color: ColorStyle.dark,
                  ),
                ),
                // const SizedBox(height: 4),
                // Text(
                //   'Usia ${schedule.isObligate ? 'wajib' : 'opsional'}',
                //   style: GoogleTextStyle.fw400.copyWith(
                //     fontSize: 14,
                //     color: ColorStyle.disable,
                //   ),
                // ),
                // const SizedBox(height: 4),
                // Text(
                //   schedule.immunization.vaccineName,
                //   style: GoogleTextStyle.fw500.copyWith(
                //     fontSize: 14,
                //     color: ColorStyle.dark,
                //   ),
                // ),
              ],
            ),
          ),
          // if (schedule.isObligate)
          //   Container(
          //     padding: const EdgeInsets.symmetric(
          //       horizontal: 12,
          //       vertical: 6,
          //     ),
          //     decoration: BoxDecoration(
          //       color: ColorStyle.primary.withOpacity(0.1),
          //       borderRadius: BorderRadius.circular(20),
          //     ),
          //     child: Text(
          //       'Wajib',
          //       style: GoogleTextStyle.fw500.copyWith(
          //         fontSize: 12,
          //         color: ColorStyle.primary,
          //       ),
          //     ),
          //   ),
        ],
      ),
    );
  }
}
