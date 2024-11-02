import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stunting_app/features/history/controllers/history_controller.dart';
import 'package:stunting_app/shared/styles/color_style.dart';
import 'package:stunting_app/shared/styles/google_text_style.dart';

class RiwayatPage extends StatelessWidget {
  const RiwayatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final historyController = Get.find<HistoryController>();

    return Scaffold(
      backgroundColor: ColorStyle.white,
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            'Data Riwayat Perkembangan',
            style: GoogleTextStyle.fw500.copyWith(
              fontSize: 15,
              color: Colors.grey[600],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Obx(() => DataTable(
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Text('Tanggal'),
                      ),
                      DataColumn(
                        label: Text('Umur (Bulan)'),
                      ),
                      DataColumn(
                        label: Text('Tinggi (cm)'),
                      ),
                      DataColumn(
                        label: Text('Berat (kg)'),
                      ),
                      DataColumn(
                        label: Text('Status BB/U'),
                      ),
                      DataColumn(
                        label: Text('Status TB/U'),
                      ),
                      DataColumn(
                        label: Text('Status BB/TB'),
                      ),
                    ],
                    rows: historyController.historyData.map<DataRow>((item) {
                      return DataRow(
                        cells: <DataCell>[
                          DataCell(Text(item['service_date'] ?? '-')),
                          DataCell(Text(item['age'].toString())),
                          DataCell(Text(item['height'].toString())),
                          DataCell(Text(item['weight'].toString())),
                          DataCell(Text(item['weight_for_age_res'] ?? '-')),
                          DataCell(Text(item['height_for_age_res'] ?? '-')),
                          DataCell(Text(item['bmi_res'] ?? '-')),
                        ],
                      );
                    }).toList(),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
