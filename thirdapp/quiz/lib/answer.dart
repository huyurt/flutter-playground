import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answer;
  final Function answerHandler;

  const Answer({@required this.answer, @required this.answerHandler});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text(answer),
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: answerHandler,
      ),
    );
  }
}
