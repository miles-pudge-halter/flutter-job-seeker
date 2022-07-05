import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/feature/dashboard/controller/dashboard_controller.dart';
import 'package:job_seeker/feature/dashboard/tabs/home/view/home_tab.dart';
import 'package:job_seeker/feature/dashboard/tabs/job_tab.dart';
import 'package:job_seeker/feature/dashboard/tabs/profile_tab.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return Scaffold(
        bottomNavigationBar: _buildBottomNavigationBar(
            controller.tabIndex, controller.changeTabIndex),
        body: SafeArea(
          child: IndexedStack(
            index: controller.tabIndex,
            children: const [
              HomeTab(),
              JobTab(),
              ProfileTab(),
            ],
          ),
        ),
      );
    });
  }

  BottomNavigationBar _buildBottomNavigationBar(
      int currentIndex, void Function(int) onTabChange) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTabChange,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      elevation: 12,
      items: [
        _bottomNavigationBarItem(icon: Icons.home_filled, label: ''),
        _bottomNavigationBarItem(icon: Icons.work, label: ''),
        _bottomNavigationBarItem(icon: Icons.person_rounded, label: ''),
      ],
    );
  }

  _bottomNavigationBarItem({required IconData icon, String? label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
