import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Discover The Perfect Job',
          style: Theme.of(context).textTheme.headline1,
        ),
      ],
    );
  }
}
