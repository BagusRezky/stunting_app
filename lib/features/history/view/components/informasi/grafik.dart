import 'package:flutter/material.dart';

class Grafik extends StatelessWidget {
  const Grafik({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Grafik',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 200,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
