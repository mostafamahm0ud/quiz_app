import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions_data.dart';
import 'package:quiz_app/widgets/custom_elevated_button.dart';
import 'package:quiz_app/widgets/custom_qusetion_text.dart';

class Questions extends StatefulWidget {
  const Questions({super.key, required this.onSelectedAnswer});

  final void Function(String answer) onSelectedAnswer;

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  var questionIndex = 0;

  void answerQuestion(String answer) {
    log(answer);
    widget.onSelectedAnswer(answer);
    setState(() {
      questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionIndex];
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomQustionText(currentQuestion.text),
          const SizedBox(
            height: 30,
          ),

          // use ... to make spraed operator for make the list to widgets
          ...currentQuestion.shuffeldAnswers.map((e) {
            return Container(
              margin: const EdgeInsets.all(8),
              child: CustomElevatedBustton(
                answers: e,
                onPressed: () {
                  answerQuestion(e);
                },
              ),
            );
          })
        ],
      ),
    );
  }
}
