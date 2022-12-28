import 'package:flutter/material.dart';
import './questions.dart';
import './answerButton.dart';
import './result.dart';
import './quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _index = 0;
  var _totalScore = 0;
  void _restart() {
    setState(() {
      _index = 0;
      _totalScore = 0;
    });
  }

  void _changeindex(int score) {
    setState(() {
      _index++;
      _totalScore += score;
    });
  }

  static const _questionBank = [
    {
      'questionText': 'What\'s the color ?',
      'answers': [
        {'text': 'Red', 'score': 10},
        {'text': 'Green', 'score': 5},
        {'text': 'Blue', 'score': 3},
        {'text': 'Yellow', 'score': 1}
      ]
    },
    {
      'questionText': 'What\'s the distance ?',
      'answers': [
        {'text': '10km', 'score': 10},
        {'text': '30km', 'score': 3},
        {'text': '40km', 'score': 1}
      ]
    },
    {
      'questionText': 'What\'s the animal ?',
      'answers': [
        {'text': 'Dog', 'score': 10},
        {'text': 'Cat', 'score': 5},
        {'text': 'Lion', 'score': 3},
        {'text': 'Tiger', 'score': 1}
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Personality Quiz'),
        backgroundColor: Colors.blue,
      ),
      body: _index < _questionBank.length
          ? Quiz(
              index: _index,
              changeindex: _changeindex,
              questionBank: _questionBank)
          : result(_totalScore, _restart),
    ));
  }
}
