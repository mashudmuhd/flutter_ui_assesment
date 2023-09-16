import 'package:flutter/material.dart';
import 'package:flutter_ui_assesment/controller/dash_bord_screen_controller/dash_bord_screen_controller.dart';
import 'package:flutter_ui_assesment/screens/dash_bord_screen/profile_screen/ProfileScreen.dart';
import 'package:flutter_ui_assesment/screens/dash_bord_screen/schedule_screen/schedule_screen.dart';
import 'package:flutter_ui_assesment/utils/app_colors.dart';
import 'package:get/get.dart';

import 'chat_screen/ChatScreen.dart';
import 'home_screen/home_screen.dart';

class DashBordScreen extends StatelessWidget {
  const DashBordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DashBordScreenController dashBordScreenController =
    Get.put(DashBordScreenController());

    final List<Widget> pages = [
      const HomeScreen(),
      const ScheduleScreen(),
      const ChatScreen(),
      const ProfileScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Obx(
              () => pages[dashBordScreenController.selectedIndex.value],
        ),
      ),
      bottomNavigationBar: Obx(
            () => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey,
          selectedItemColor: AppColors.primaryColor,
          currentIndex: dashBordScreenController.selectedIndex.value,
          onTap: dashBordScreenController.updateSelectedIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.feed_outlined),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                backgroundColor: AppColors.primaryColor,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_outlined),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
