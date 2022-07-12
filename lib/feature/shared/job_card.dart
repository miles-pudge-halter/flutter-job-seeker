import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/data/models/job_model.dart';
import 'package:job_seeker/feature/shared/buttons.dart';
import 'package:job_seeker/utils/string_utils.dart';

import '../../Constants.dart';

class JobCard extends StatelessWidget {
  final JobModel job;
  final void Function() onClick;

  const JobCard({required this.job, required this.onClick, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onClick,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Row(children: [
                    Image.network(
                      job.logo ?? '',
                      width: 50,
                      height: 50,
                      fit: BoxFit.contain,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Icon(
                          Icons.location_city,
                          size: 50,
                          color: Colors.grey.shade400,
                        );
                      },
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            job.companyName,
                            style:
                                Theme.of(context).textTheme.bodyText2?.copyWith(
                                      color: Colors.grey.shade500,
                                      fontSize: 12,
                                    ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            job.role,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
                SizedBox(width: 10),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    color: ThemeColor().blue,
                  ),
                  child: const Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class JobHeroCard extends StatelessWidget {
  final JobModel job;
  final void Function() onClick;

  const JobHeroCard({required this.job, required this.onClick, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onClick,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.network(
                'https://www.tmf-group.com/-/media/images/corporate-site/background-images/generic-website-imagery/generic-buildings/1500x900-modern-architecture-office-building-silhouettes-of-skyscrapers.jpg?h=252&la=en&mw=420&w=420&hash=3E7CAFD4431F858FAFD5735F07F657086216A988',
              ).image,
              colorFilter: ColorFilter.mode(
                  ThemeColor().blue.withOpacity(0.8), BlendMode.srcOver),
              fit: BoxFit.cover,
            ),
            color: Colors.grey.shade200,
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        job.logo ?? '',
                        width: 50,
                        height: 50,
                        fit: BoxFit.contain,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Icon(
                            Icons.location_city,
                            size: 50,
                            color: Colors.grey.shade400,
                          );
                        },
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              job.role,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '${(job.employmentType != null) ? (job.employmentType?.toTitleCase()) : '' } ${(job.remote) ? 'Remote' : ''}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 50,
                                    child: NFQSecondaryButton(
                                      'Apply this job',
                                      () {
                                        Get.toNamed(
                                          '/job/details',
                                          arguments: {'job': job},
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(16)),
                                    color: ThemeColor().yellow,
                                  ),
                                  child: const Icon(
                                    Icons.send,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
