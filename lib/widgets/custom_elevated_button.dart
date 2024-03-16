import 'package:flutter/material.dart';

class CustomElevatedBustton extends StatelessWidget {
  const CustomElevatedBustton(
      {super.key, required this.answers, required this.onPressed});

  final String answers;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: const Color.fromARGB(193, 0, 0, 0),
        backgroundColor: Color.fromARGB(71, 111, 198, 209),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: onPressed,
      child: Text(
        answers,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
