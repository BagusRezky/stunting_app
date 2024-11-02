import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:stunting_app/features/history/controllers/history_controller.dart';
import 'package:stunting_app/features/history/view/components/informasi/indeks.dart';
import 'package:stunting_app/features/history/view/components/informasi/zscore_description.dart';

// category_selector.dart
class CategorySelector extends StatefulWidget {
  const CategorySelector({super.key});

  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  String? selectedCategory;
  Color selectedColor = Colors.transparent;

  @override
  void initState() {
    super.initState();
    selectedCategory = 'Berat / Umur'; // Set default category
  }

  String getStatus(String category) {
    final historyController = Get.find<HistoryController>();
    if (historyController.historyData.isEmpty) return '-';

    // Mengambil data terakhir (paling baru)
    final latestData = historyController.historyData
        .lastWhere((data) => data != null, orElse: () => null);

    if (latestData == null) return '-';

    print('Latest data: $latestData'); // Untuk debugging

    switch (category) {
      case 'Berat / Umur':
        return latestData['weight_for_age_res'] ?? '-';
      case 'Tinggi / Umur':
        return latestData['height_for_age_res'] ?? '-';
      case 'Berat / Tinggi':
        return latestData['bmi_res'] ?? '-';
      default:
        return '-';
    }
  }

  Color getStatusColor(String status) {
    // Tambahkan print untuk debugging
    print('Current status: $status');

    if (status.toLowerCase().contains('normal') ||
        status.toLowerCase().contains('baik')) {
      return Colors.green;
    } else if (status.toLowerCase().contains('risiko') ||
        status.toLowerCase().contains('waspada')) {
      return Colors.orange;
    } else if (status.toLowerCase().contains('kurang') ||
        status.toLowerCase().contains('pendek') ||
        status.toLowerCase().contains('stunting')) {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildCategoryButton('Berat / Umur'),
            buildCategoryButton('Tinggi / Umur'),
            buildCategoryButton('Berat / Tinggi'),
          ],
        ),
        const SizedBox(height: 20.0),
        if (selectedCategory != null)
          Obx(() {
            final status = getStatus(selectedCategory!);
            final statusColor = getStatusColor(status);

            // Tambahkan print untuk debugging
            print('Selected category: $selectedCategory');
            print('Current status: $status');
            print('Status color: $statusColor');

            return ResultContainer(
              category: selectedCategory!,
              status: status,
              statusColor: statusColor,
            );
          }),
        const SizedBox(height: 20.0),
      ],
    );
  }

  Widget buildCategoryButton(String category) {
    bool isSelected = selectedCategory == category;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = category;
          selectedColor = isSelected ? Colors.transparent : Colors.blue;
        });
      },
      child: Container(
        padding: EdgeInsets.all(7.h),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          category,
          style: TextStyle(
            fontSize: 15.0,
            color: isSelected ? Colors.white : Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class ResultContainer extends StatelessWidget {
  final String category;
  final String status;
  final Color statusColor;

  const ResultContainer({
    super.key,
    required this.category,
    required this.status,
    required this.statusColor,
  });

  String getDescription(String category) {
    switch (category) {
      case 'Berat / Umur':
        return 'Indeks berat badan menurut usia atau BB/U menggambarkan berat badan relatif dibandingkan dengan usia anak.';
      case 'Tinggi / Umur':
        return 'Indeks panjang badan menurut usia (PB/U) untuk anak usia 0 - 24 bulan atau tinggi badan menurut usia (TB/U) untuk anak usia 24 - 60 bulan menggambarkan pertumbuhan panjang atau tinggi badan anak berdasarkan usianya.';
      case 'Berat / Tinggi':
        return 'Indeks berat badan menurut panjang badan atau tinggi badan ( BB/PB atau BB/TB) menggambarkan apakah berat badan anak sesuai terhadap pertumbuhan panjang atau tinggi badannya.';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12.0),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: statusColor),
            color: statusColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kategori yang dipilih: $category',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                ),
              ),
              const SizedBox(height: 4.0),
              Text(
                'Status: $status',
                style: TextStyle(
                  color: statusColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8.0),
        Indeks(
          category: category,
          description: getDescription(category),
        ),
        const SizedBox(height: 8.0),
        const Zscore(),
      ],
    );
  }
}
