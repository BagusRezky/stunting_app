import 'package:flutter/material.dart';
import 'package:stunting_app/features/history/view/components/informasi/informasi_widget.dart';

class InformasiPage extends StatelessWidget {
  const InformasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              // Menampilkan kategori
              CategorySelector(),
            ],
          ),
        ),
      ),
    );
  }
}
