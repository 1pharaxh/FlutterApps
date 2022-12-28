import 'package:flutter/material.dart';
import './questions.dart';
import './answerButton.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questionBank;
  final void Function(int) changeindex;
  final int index;
  Quiz(
      {required this.questionBank,
      required this.changeindex,
      required this.index,
      super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Question(questionBank[index]['questionText'] as String),
        ...(questionBank[index]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Next(() => changeindex(answer['score'] as int),
              answer['text'] as String);
        }).toList(),
      ],
    );
  }
}
