import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stunting_app/features/jadwal/controllers/jadwal_controller.dart';
import 'package:stunting_app/shared/styles/color_style.dart';
import 'package:stunting_app/shared/styles/google_text_style.dart';
import 'package:stunting_app/shared/widgets/custom_button.dart';
import 'package:stunting_app/shared/widgets/custom_dropdown.dart';

class JadwalScreen extends StatelessWidget {
  JadwalScreen({super.key});
  final JadwalController controller = Get.put(JadwalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyle.white,
      appBar: AppBar(
        backgroundColor: ColorStyle.white,
        centerTitle: true,
        title: const Text('Jadwal Posyandu'),
        titleTextStyle: GoogleTextStyle.fw600
            .copyWith(color: ColorStyle.dark, fontSize: 17),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Obx(() => CustomDropdownField(
                    label: 'Posyandu',
                    items:
                        controller.posyanduList.map((pos) => pos.name).toList(),
                    value: controller.selectedPosyandu.value?.name,
                    onChanged: (name) {
                      if (name != null) {
                        final selected = controller.posyanduList
                            .firstWhere((pos) => pos.name == name);
                        controller.fetchDates(selected);
                      }
                    },
                  )),
              const SizedBox(height: 10),
              Obx(() => CustomDropdownField(
                    label: 'Tanggal Imunisasi',
                    items:
                        controller.datesList.map((date) => date.date).toList(),
                    value: controller.selectedDate.value,
                    onChanged: (value) {
                      if (value != null) {
                        controller.selectedDate.value = value;
                      }
                    },
                  )),
              const SizedBox(height: 20),
              CustomButton(
                onPressed: () async {
                  if (controller.selectedPosyandu.value != null &&
                      controller.selectedDate.value != null) {
                    await controller.fetchImmunizationSchedule();
                  } else {
                    Get.snackbar(
                      'Perhatian',
                      'Silahkan pilih Posyandu dan tanggal terlebih dahulu',
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                      snackPosition: SnackPosition.TOP,
                    );
                  }
                },
                text: 'Tampilkan',
                backgroundColor: ColorStyle.primary,
                textStyle: GoogleTextStyle.fw500.copyWith(
                  color: ColorStyle.white,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 24),
              Obx(() {
                if (controller.isLoading.value) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }

                if (controller.hasError.value) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.error_outline,
                            color: Colors.red,
                            size: 48,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            controller.errorMessage.value,
                            style: GoogleTextStyle.fw500.copyWith(
                              color: Colors.red,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                }

                if (controller.immunizationSchedules.isNotEmpty) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jadwal Imunisasi',
                        style: GoogleTextStyle.fw600.copyWith(
                          color: ColorStyle.dark,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.immunizationSchedules.length,
                        itemBuilder: (context, index) {
                          final schedule =
                              controller.immunizationSchedules[index];
                          return Card(
                            margin: const EdgeInsets.only(bottom: 12),
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          schedule.immunization.vaccineName,
                                          style: GoogleTextStyle.fw600.copyWith(
                                            fontSize: 16,
                                            color: ColorStyle.dark,
                                          ),
                                        ),
                                      ),
                                      if (schedule.isObligate)
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            color: ColorStyle.primary
                                                .withOpacity(0.1),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Text(
                                            'Wajib',
                                            style:
                                                GoogleTextStyle.fw500.copyWith(
                                              fontSize: 12,
                                              color: ColorStyle.primary,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Usia ${schedule.immunization.initialRangeAge} - ${schedule.immunization.finalRangeAge} ${schedule.immunization.timePeriodAge}',
                                    style: GoogleTextStyle.fw400.copyWith(
                                      fontSize: 14,
                                      color: ColorStyle.dark,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    schedule.posyandu.address,
                                    style: GoogleTextStyle.fw400.copyWith(
                                      fontSize: 14,
                                      color: ColorStyle.dark,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                }

                return const SizedBox.shrink();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
