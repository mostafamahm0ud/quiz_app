// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions_data.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.slectedAnswer, required this.restartQuiz});

  final List<String> slectedAnswer;
  final void Function() restartQuiz;

  List<Map<String, Object>> get summeryData {
    final List<Map<String, Object>> summry = [];
    for (var i = 0; i < slectedAnswer.length; i++) {
      summry.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': slectedAnswer[i]
      });
    }
    return summry;
  }

  @override
  Widget build(BuildContext context) {
    int numOfCorectAnswer = 0;

    for (var element in summeryData) {
      if (element['correct_answer'] == element['user_answer']) {
        numOfCorectAnswer++;
      }
    }
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'you Answerd $numOfCorectAnswer out of ${slectedAnswer.length} questions corectly',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 400,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...summeryData.map((e) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                                backgroundColor:
                                    e['correct_answer'] == e['user_answer']
                                        ? Color.fromARGB(255, 4, 228, 123)
                                        : Color.fromARGB(225, 158, 19, 19),
                                child: Text(((e['question_index'] as int) + 1)
                                    .toString())),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e['question'].toString(),
                                    style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 1, 30, 34),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'The correct answer: ${e['correct_answer'].toString()}',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 14, 35, 155),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'your answer: ${e['user_answer'].toString()}',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 55, 97, 62),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton.icon(
              onPressed: restartQuiz,
              icon: Icon(
                Icons.restart_alt,
                size: 24,
              ),
              label: Text(
                'Restart Quiz',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ))
        ],
      ),
    );
  }
}
