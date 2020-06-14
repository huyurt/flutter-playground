import 'package:flutter/cupertino.dart';
import 'package:quize/question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Quiz {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
  ];

  void nextQuestion(BuildContext context) {
    if (_questionNumber == _questionBank.length - 1) {
      Alert(
              context: context,
              title: 'Finished',
              desc: 'You\'ve reached the end of the quiz.')
          .show();
    } else {
      ++_questionNumber;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  int getQuestionNumber() {
    return _questionBank.length;
  }
}
