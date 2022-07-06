import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:job_seeker/data/models/job_model.dart';
import 'package:job_seeker/feature/shared/buttons.dart';

class JobDetailsPage extends StatelessWidget {
  final JobModel job = JobModel(
    id: '1',
    role: 'Android Engineer',
    companyName: 'Google',
    datePosted: '1/1/1999',
    keywords: ['keywords'],
    remote: false,
    logo:
        'https://myplaceloungechiangmai.com/wp-content/uploads/2015/02/google-logo-icon-PNG-Transparent-Background.png',
    text:
        '<p>Cube is a data operating system that enables organizations to easily automate their data work.  We are looking to add a Senior Product Designer to our dynamic team who would be an important part of growing our business.</p>\n<p>The Senior Product Designer will contribute in the following areas:</p>\n<h4>Responsibilities</h4>\n<ul>\n<li><p>Participate in agile sprint planning sessions and daily standups where the team aligns on priorities</p>\n</li>\n<li><p>Transform product manager specs into UX/UI designs</p>\n</li>\n<li><p>Define requirements and designs in coordination with product managers, engineers and users</p>\n</li>\n<li><p>Create wireframes, user flows, and everything from low- to high- fidelity designs</p>\n</li>\n<li><p>Drive redesign of existing website and software platform</p>\n</li>\n<li><p>Conduct user testing and research to understand customer behavior and expectations</p>\n</li>\n<li><p>Proactively define and deliver industry-leading experiences for our customers</p>\n</li>\n<li><p>Engage with engineers and product managers for thorough QA at the end of the delivery process</p>\n</li>\n<li><p>Play a part in maintaining the brand\'s consistency across all web designs and marketing materials.</p>\n</li>\n</ul>\n<h4>Requirements:</h4>\n<ul>\n<li><p>Experience with UX/UI design for web applications</p>\n</li>\n<li><p>Strong technical skills and experience working with popular graphic design programs (Photoshop, Illustrator, Figma, Sketch, etc)</p>\n</li>\n<li><p>Familiarity with pattern library + atomic design principles</p>\n</li>\n<li><p>Strong interest in data analytics and SaaS platforms</p>\n</li>\n<li><p>Appetite for working in a fast-paced, demanding environment with the potential for exponential growth</p>\n</li>\n<li><p>Desire to play a direct role in growing our company and improving our product</p>\n</li>\n<li><p>Ability to take on significant responsibility starting day one and be exposed to multiple aspects of the product / design lifecycle</p>\n</li>\n<li><p>Talent for solving design challenges in the data and analytics space</p>\n</li>\n<li><p>Prior exposure to data science and statistical modeling products a plus</p>\n</li>\n</ul>\n<p>We are looking to fill the Designer role quickly given recent growth.  In addition to base salary, this role has the opportunity to participate in our stock option plan.</p>\n',
  );

  JobDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        job.role,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        job.companyName,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade500,
                        ),
                      ),
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
                        child: NFQPrimaryButton('Apply This Job', () {}),
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
