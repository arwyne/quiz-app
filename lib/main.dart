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
      "answers": ["Black", "Red", "Blue", "Yellow"]
    },
    {
      "questionText": "What's your favorite animal?",
      "answers": ["Dog", "Cat", "Snake", "Rabbit"]
    },
    {
      "questionText": "What's your favorite instructor?",
      "answers": ["Max1", "Max2", "Max3", "Max4"]
    }
  ];

  var _questionIndex = 0;

  void _answerQuestion() {
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
            : Result(),
      ),
    );
  }
}
