import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stunting_app/features/history/view/components/informasi/indeks.dart';
import 'package:stunting_app/features/history/view/components/informasi/zscore_description.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({super.key});

  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  String? selectedCategory;
  Color selectedColor = Colors.transparent;

  // Status dan Z-Score yang berbeda untuk setiap kategori
  Map<String, String> statusMap = {
    'Berat / Umur': 'Gizi Kurang (Wasted)',
    'Tinggi / Umur': 'Pendek (Stunting)',
    'Berat / Tinggi': 'Normal',
  };

  Map<String, double> zScoreMap = {
    'Berat / Umur': -1.5,
    'Tinggi / Umur': -2.0,
    'Berat / Tinggi': 0.0,
  };

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
        // Menampilkan container hasil sesuai kategori yang dipilih
        if (selectedCategory != null)
          ResultContainer(
              category: selectedCategory!,
              status: statusMap[selectedCategory]!,
              zScore: zScoreMap[selectedCategory]!),
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
          selectedColor = isSelected
              ? Colors.transparent
              : Colors.blue; // Ubah warna saat dipilih
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
  final double zScore;

  const ResultContainer({
    super.key,
    required this.category,
    required this.status,
    required this.zScore,
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
          height: 100.0,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green),
            color: Colors.green.withOpacity(0.1),
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
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Z-Score: $zScore',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
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
