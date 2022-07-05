import 'package:flutter/material.dart';

import '../../Constants.dart';

class JobCard extends StatelessWidget {
  const JobCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: ThemeColor().lightGrey,
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(children: [
                Image.network(
                  'https://myplaceloungechiangmai.com/wp-content/uploads/2015/02/google-logo-icon-PNG-Transparent-Background.png',
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Google',
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: Colors.grey.shade500,
                            fontSize: 12,
                          ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Android Engineer',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ]),
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
    );
  }
}
