import 'package:flutter/material.dart';
import 'package:job_seeker/Constants.dart';
import 'package:job_seeker/feature/shared/job_card.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          _buildHeader(context),
          const SizedBox(height: 20),
          _buildSearchBox(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              shrinkWrap: true,
              children: [
                JobCard(),
                JobCard(),
                JobCard(),
              ],
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Discover The Perfect\nJob',
            style: Theme.of(context).textTheme.headline2,
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                color: ThemeColor().lightGrey),
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
          color: ThemeColor().lightGrey,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: const Icon(
                  Icons.search,
                  size: 30,
                ),
                hintText: 'Job title, keyword or company',
                hintStyle: TextStyle(
                  color: Colors.grey.shade600,
                )),
          ),
        ),
      ),
    );
  }
}
