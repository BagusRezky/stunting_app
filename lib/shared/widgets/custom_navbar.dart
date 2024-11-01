import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stunting_app/shared/controllers/navigation_controller.dart';
import 'package:stunting_app/shared/styles/color_style.dart';

class CustomNavBar extends StatelessWidget {
  CustomNavBar({super.key});
  final NavigationController navController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return BottomNavigationBar(
        currentIndex: navController.selectedIndex.value,
        onTap: (index) => navController.changeTabIndex(index),
        items: const [
          BottomNavigationBarItem(
            backgroundColor: ColorStyle.white,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: 'Tracker',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: ColorStyle.primary,
        unselectedItemColor: const Color.fromARGB(255, 167, 162, 162),
        // showUnselectedLabels: true,
      );
    });
  }
}
