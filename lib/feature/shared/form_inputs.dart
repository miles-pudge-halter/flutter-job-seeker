import 'package:flutter/material.dart';
import 'package:job_seeker/Constants.dart';

class NFQTextField extends StatelessWidget {
  final String hintText;
  final TextInputType inputType;
  final bool obscureText;
  final TextInputAction inputAction;
  final double height;
  final int maxLines;

  NFQTextField(
    this.hintText, {
    this.inputType = TextInputType.text,
    this.obscureText = false,
    this.inputAction = TextInputAction.done,
    this.height = 55,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: ThemeColor().lightGrey,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: TextField(
          maxLines: maxLines,
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
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  NFQTextFormField(
    this.hintText, {
    this.inputType = TextInputType.text,
    this.obscureText = false,
    this.inputAction = TextInputAction.done,
    this.controller,
    this.validator,
  });

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
          controller: controller,
          validator: validator,
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
