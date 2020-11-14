import "package:flutter/material.dart";

import "./quiz.dart";
import "./result.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "What's your favorite color?",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Red", "score": 5},
        {"text": "Blue", "score": 3},
        {"text": "White", "score": 1}
      ]
    },
    {
      "questionText": "What's your favorite animal?",
      "answers": [
        {"text": "Cat", "score": 5},
        {"text": "Snake", "score": 10},
        {"text": "Dog", "score": 3},
        {"text": "Rabbit", "score": 7}
      ]
    },
    {
      "questionText": "What's your favorite sports?",
      "answers": [
        {"text": "Basketball", "score": 3},
        {"text": "Volleyball", "score": 1},
        {"text": "Baseball", "score": 5},
        {"text": "Wrestling", "score": 8}
      ]
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print("We have more questions!");
    } else {
      print("No more questions");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Firs App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
