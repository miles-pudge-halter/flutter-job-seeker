import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/Constants.dart';
import 'package:job_seeker/feature/dashboard/controller/dashboard_controller.dart';
import 'package:job_seeker/feature/dashboard/tabs/home/view/home_tab.dart';
import 'package:job_seeker/feature/dashboard/tabs/job/view/job_tab.dart';
import 'package:job_seeker/feature/dashboard/tabs/profile/profile_tab.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);

  final Color selectedColor = ThemeColor().blue;
  final Color defColor = ThemeColor().lightGrey;

  List<Widget> tabs = [
    HomeTab(),
    JobTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return Scaffold(
        extendBody: true,
        bottomNavigationBar: _buildBottomNavigationBar(
            controller.tabIndex, controller.changeTabIndex),
        body: Container(
          height: double.infinity,
          child: SafeArea(
            child: tabs[controller.tabIndex],
          ),
        ),
      );
    });
  }

  Widget _buildBottomNavigationBar(
      int currentIndex, void Function(int) onTabChange) {
    return BottomAppBar(
      elevation: 35,
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade500,
                offset: Offset.fromDirection(1.5, 10),
                blurRadius: 15,
                spreadRadius: 4,
                blurStyle: BlurStyle.normal,
              )
            ]),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildTabItem(
                icon: Icons.home_filled,
                index: 0,
                selectedIndex: currentIndex,
                onPressed: onTabChange),
            _buildTabItem(
                icon: Icons.work,
                index: 1,
                selectedIndex: currentIndex,
                onPressed: onTabChange),
            _buildTabItem(
                icon: Icons.person_rounded,
                index: 2,
                selectedIndex: currentIndex,
                onPressed: onTabChange),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required IconData icon,
    required int index,
    required int selectedIndex,
    required ValueChanged<int> onPressed,
  }) {
    Color color = selectedIndex == index ? selectedColor : defColor;
    return Expanded(
      child: SizedBox(
        height: 65,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  icon,
                  color: color,
                  size: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
