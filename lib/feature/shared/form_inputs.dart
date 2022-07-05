import 'package:flutter/material.dart';
import 'package:job_seeker/Constants.dart';

class NFQTextField extends StatelessWidget {
  final String hintText;

  NFQTextField(this.hintText);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: ThemeColor().lightGrey,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.grey.shade500,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
    );
  }
}

class NFQTextFormField extends StatelessWidget {
  final String hintText;

  NFQTextFormField(this.hintText);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: ThemeColor().lightGrey,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: TextFormField(
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.grey.shade500,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
    );
  }
}
