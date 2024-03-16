import 'package:flutter/material.dart';

class CustomQustionText extends StatelessWidget {
  const CustomQustionText(this.qusetion, {super.key});

  final String qusetion;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Text(
        qusetion,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(155, 0, 0, 0),
        ),
      ),
    );
  }
}
