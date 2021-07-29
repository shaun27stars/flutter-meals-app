import 'package:flutter/material.dart';

class TextWithIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color? color;

  const TextWithIcon(
      {Key? key, required this.text, required this.icon, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon),
        SizedBox(width: 6),
        Text(text, style: TextStyle(color: color)),
      ],
    );
  }
}
