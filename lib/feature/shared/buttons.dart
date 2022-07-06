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
        elevation: MaterialStateProperty.all(0),
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

class NFQIconButton extends StatelessWidget {

  final IconData icon;
  final void Function() onClick;

  const NFQIconButton({required this.icon, required this.onClick, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(Colors.grey.shade300),
          padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
        ),
        onPressed: onClick,
        child: Icon(
          icon,
          color: ThemeColor().yellow,
        ));
  }
}

class ActionIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color borderColor;
  final void Function() onClick;

  ActionIcon(
      {required this.icon,
      required this.onClick,
      required this.backgroundColor,
      required this.borderColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 1),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: backgroundColor),
        child: Icon(
          icon,
          color: Colors.grey.shade700,
        ),
      ),
    );
  }
}
