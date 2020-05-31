import 'package:firstapp/model/question.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Quize extends StatefulWidget {
  @override
  _QuizeState createState() => _QuizeState();
}

class _QuizeState extends State<Quize> {
  int currentQuestionIndex = 0;
  List questions = [
    Question.name(
        "The U.S. Declaration of Independence was adopted in 1776.", true),
    Question.name("The Supreme law of the land is the Constitution.", true),
    Question.name(
        "The two rights in the Declaration of Independence are:"
        "  \n Life  "
        "  \n Pursuit of happiness.",
        true),
    Question.name("The (U.S.) Constitution has 26 Amendments.", false),
    Question.name(
        "Freedom of religion means:\nYou can practice any religion, "
        "or not practice a religion.",
        true),
    Question.name("Journalist is one branch or part of the government.", false),
    Question.name("The Congress does not make federal laws.", false),
    Question.name("There are 100 U.S. Senators.", true),
    Question.name("We elect a U.S. Senator for 4 years.", false),
    Question.name("We elect a U.S. Representative for 2 years", true),
    Question.name(
        "A U.S. Senator represents all people of the United States", false),
    Question.name("We vote for President in January.", false),
    Question.name("Who vetoes bills is the President.", true),
    Question.name("The Constitution was written in 1787.", true),
    Question.name('George Bush is the \ " Father of Our Country " \.', false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image.asset(
                  'images/flag.png',
                  width: 250,
                  height: 180,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(14.4),
                      border: Border.all(
                          color: Colors.blueGrey.shade400,
                          style: BorderStyle.solid)),
                  height: 120.0,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        questions[currentQuestionIndex].questionText,
                        style: TextStyle(fontSize: 17.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => prevQuestion(),
                    color: Colors.blueGrey.shade900,
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => checkAnswer(true, context),
                    color: Colors.blueGrey.shade900,
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => checkAnswer(false, context),
                    color: Colors.blueGrey.shade900,
                    child: Icon(
                      Icons.clear,
                      color: Colors.white,
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => nextQuestion(),
                    color: Colors.blueGrey.shade900,
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  checkAnswer(bool userChoice, BuildContext context) {
    String result;
    Color color;
    if (userChoice == questions[currentQuestionIndex].isCorrect) {
      result = 'Correct!';
      color = Colors.green;
    } else {
      result = 'Incorrect!';
      color = Colors.redAccent;
    }

    final snackBar = SnackBar(
      backgroundColor: color,
      duration: Duration(milliseconds: 500),
      content: Text(result),
    );
    Scaffold.of(context).showSnackBar(snackBar);

    Future.delayed(const Duration(milliseconds: 1000), () {
      updateQuestion();
    });
  }

  updateQuestion() {
    setState(() {
      currentQuestionIndex = (currentQuestionIndex + 1) % questions.length;
    });
  }

  prevQuestion() {
    setState(() {
      currentQuestionIndex = (currentQuestionIndex - 1) % questions.length;
    });
  }

  nextQuestion() {
    updateQuestion();
  }
}
