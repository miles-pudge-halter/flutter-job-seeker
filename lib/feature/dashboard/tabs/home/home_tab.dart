import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/Constants.dart';
import 'package:job_seeker/feature/dashboard/tabs/home/home_controller.dart';
import 'package:job_seeker/feature/shared/job_card.dart';
import 'package:job_seeker/feature/shared/radio_list_tile.dart';

import 'home_state.dart';

class HomeTab extends StatelessWidget {
  HomeTab({Key? key}) : super(key: key);
  var searchFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 10),
          _buildHeader(context),
          const SizedBox(height: 20),
          _buildSearchBox(),
          Obx(() {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NFQRadioListTile<String>(
                    value: '',
                    groupValue: controller.filterValue,
                    title: 'All',
                    onChanged: controller.changeFilterValue,
                  ),
                  NFQRadioListTile<String>(
                    value: 'full time',
                    groupValue: controller.filterValue,
                    title: 'Full Time',
                    onChanged: controller.changeFilterValue,
                  ),
                  NFQRadioListTile<String>(
                    value: 'contract',
                    groupValue: controller.filterValue,
                    title: 'Part Time / Contract',
                    onChanged: controller.changeFilterValue,
                  ),
                ],
              ),
            );
          }),
          SizedBox(height: 10),
          Obx(() {
            if (controller.heroItem.value != null && controller.state is! HomeLoading) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: JobHeroCard(
                  job: controller.heroItem.value!,
                  onClick: () {
                    Get.toNamed(
                      '/job/details',
                      arguments: {'job': controller.heroItem.value},
                    );
                  },
                ),
              );
            } else {
              return const SizedBox(height: 0);
            }
          }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Obx(
                  () {
                if (controller.state is HomeSuccess) {
                  return ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: (controller.state as HomeSuccess)
                        .jobs
                        .map(
                          (job) =>
                          JobCard(
                            job: job,
                            onClick: () {
                              Get.toNamed('/job/details',
                                  arguments: {'job': job});
                            },
                          ),
                    )
                        .toList(),
                  );
                } else if (controller.state is HomeLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (controller.state is HomeEmpty) {
                  return const Center(child: Text('No jobs found'));
                } else {
                  return Center(
                      child: Text((controller.state as HomeFailure).error));
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Discover The Perfect\nJob',
            style: Theme
                .of(context)
                .textTheme
                .headline2,
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              color: Colors.grey.shade200,
            ),
            child: Icon(
              Icons.notifications,
              size: 28,
              color: ThemeColor().black,
            ),
          )
        ],
      ),
    );
  }

  _buildSearchBox() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: Colors.grey.shade200,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: TextField(
            controller: searchFieldController,
            textInputAction: TextInputAction.search,
            onSubmitted: (keyword) {
              Get.toNamed('/job/list', arguments: {'keyword': keyword});
              searchFieldController.clear();
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: const Icon(
                Icons.search,
                size: 30,
              ),
              hintText: 'Job title, keyword or company',
              hintStyle: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
