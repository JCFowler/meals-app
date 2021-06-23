import 'package:flutter/material.dart';

class IconLabel extends StatelessWidget {
  final String label;
  final IconData icon;

  IconLabel(this.label, this.icon);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 6),
        Text(label),
      ],
    );
  }
}
