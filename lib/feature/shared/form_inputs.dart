import 'package:flutter/material.dart';
import 'package:job_seeker/Constants.dart';

class NFQTextField extends StatelessWidget {
  final String hintText;
  final TextInputType inputType;
  final bool obscureText;
  final TextInputAction inputAction;

  NFQTextField(this.hintText,
      {this.inputType = TextInputType.text,
      this.obscureText = false,
      this.inputAction = TextInputAction.done});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: ThemeColor().lightGrey,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: TextField(
          obscureText: obscureText,
          keyboardType: inputType,
          textInputAction: inputAction,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey.shade500,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class NFQTextFormField extends StatelessWidget {
  final String hintText;
  final TextInputType inputType;
  final bool obscureText;
  final TextInputAction inputAction;

  NFQTextFormField(this.hintText,
      {this.inputType = TextInputType.text,
      this.obscureText = false,
      this.inputAction = TextInputAction.done});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: ThemeColor().lightGrey,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: TextFormField(
          obscureText: obscureText,
          keyboardType: inputType,
          textInputAction: inputAction,
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
