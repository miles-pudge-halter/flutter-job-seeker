import 'package:flutter/material.dart';
import 'package:job_seeker/Constants.dart';

class NFQRadioListTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String title;
  final ValueChanged<T> onChanged;

  const NFQRadioListTile({
    required this.value,
    required this.groupValue,
    required this.title,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;
    return InkWell(
      onTap: () => onChanged(value),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: isSelected ? ThemeColor().yellow : Colors.grey.shade400,
          ),
        ),
      ),
    );
  }
}
