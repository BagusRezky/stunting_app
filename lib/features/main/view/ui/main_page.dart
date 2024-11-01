import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stunting_app/features/home/view/ui/home.dart';
import 'package:stunting_app/features/profile/view/ui/profile_screen.dart';
import 'package:stunting_app/shared/controllers/navigation_controller.dart';
import 'package:stunting_app/shared/widgets/custom_navbar.dart';
// import 'package:stunting_app/shared/controller/navigation_controller.dart';
// import 'package:stunting_app/shared/widget/custom_navbar.dart';
// import 'tracker_screen.dart';
// import 'history_screen.dart';
// import 'profile_screen.dart';

class MainScreen extends StatelessWidget {
  final NavigationController navigationController =
      Get.put(NavigationController());

  final List<Widget> _pages = [
    const HomeScreen(),
    // Add your other screens here in the same order as in the BottomNavigationBar
    const ProfileScreen(),
  ];

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return IndexedStack(
          index: navigationController.selectedIndex.value,
          children: _pages,
        );
      }),
      bottomNavigationBar: CustomNavBar(),
    );
  }
}
