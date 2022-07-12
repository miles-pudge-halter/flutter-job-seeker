import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:job_seeker/Constants.dart';
import 'package:job_seeker/data/models/job_model.dart';
import 'package:job_seeker/feature/shared/buttons.dart';

class JobDetailsPage extends StatelessWidget {
  late JobModel job;

  JobDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    job = Get.arguments['job'];
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 12,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ActionIcon(
                      icon: Icons.arrow_back,
                      onClick: () {
                        Get.back();
                      },
                      backgroundColor: Colors.white,
                      borderColor: Colors.grey.shade400,
                    ),
                    ActionIcon(
                      icon: Icons.bookmark_border_outlined,
                      onClick: () {},
                      backgroundColor: Colors.grey.shade200,
                      borderColor: Colors.grey.shade200,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 100,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.all(12),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          color: Colors.grey.shade300,
                        ),
                        child: Image.network(
                          job.logo ?? '',
                          width: 100,
                          height: 100,
                          fit: BoxFit.contain,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return Icon(
                              Icons.location_city,
                              size: 100,
                              color: Colors.grey.shade400,
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        job.role,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8),
                      Text(
                        job.companyName,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      SizedBox(height: 20),
                      _buildSkills(job.keywords, context),
                      SizedBox(height: 20),
                      _buildJobDescription(job.text ?? '', context),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 13,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        height: 55,
                        child: NFQPrimaryButton(
                          'Apply This Job',
                          () {
                            Get.toNamed('/job/apply');
                          },
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 55,
                        child: NFQIconButton(
                          icon: Icons.send,
                          onClick: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildSkills(List<String> keywords, BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skills',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 2,
            children: keywords.map((skill) => _buildSkillChip(skill)).toList(),
          )
        ],
      ),
    );
  }

  Widget _buildSkillChip(String title) {
    return Chip(
      label: Text(
        title,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: ThemeColor().blue,
    );
  }

  _buildJobDescription(String description, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Job description',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Html(
          data: description,
          style: {
            "p": Style(color: Colors.grey.shade600),
            "ul": Style(color: Colors.grey.shade600),
            "h4": Style(color: Colors.grey.shade600),
          },
        ),
      ],
    );
  }
}
