import 'package:flutter/material.dart';

import 'package:zoom_clone/constant/colors.dart';

class meetingoption extends StatelessWidget {
  final String text;
  final bool ismute;
  final Function(bool) onChanged;
  const meetingoption(
      {super.key,
      required this.text,
      required this.ismute,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: secondaryBackgroundColor,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ),
        Switch(value: ismute, onChanged: onChanged)
      ]),
    );
  }
}
