import 'package:flutter/material.dart';

import './answer.dart';
import './question.dart';
// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': ['red', 'blue', 'green', 'purple'],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        'dog',
        'cat',
        'cow',
        'rabbit',
      ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': ['paulo', 'bob', 'jack', 'max'],
    },
  ];
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print('Answer Chosen!');
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < questions.length
            ? Column(
                children: <Widget>[
                  Question(
                    questions[_questionIndex]['questionText'],
                  ),
                  ...(questions[_questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    return Answer(_answerQuestion, answer);
                  }).toList()
                ],
              )
            : Text('YOU DID IT!'),
      ),
    );
  }
}
