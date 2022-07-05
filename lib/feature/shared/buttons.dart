import 'package:flutter/material.dart';
import 'package:job_seeker/Constants.dart';

class NFQPrimaryButton extends StatelessWidget {
  final String title;
  final void Function() onClick;

  NFQPrimaryButton(this.title, this.onClick);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ThemeColor().blue),
        padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
        shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
