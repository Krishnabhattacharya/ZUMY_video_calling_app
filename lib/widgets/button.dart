import 'package:flutter/material.dart';
import 'package:zoom_clone/constant/colors.dart';

class button extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;
  const button({super.key, required this.text, required this.onpressed,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              side: const BorderSide(color: buttonColor)),
          onPressed: onpressed,
          child: Text(
            text,
            style: const TextStyle(fontSize: 18),
          )),
    );
  }
}
