import 'package:flutter/material.dart';
import 'question.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper =[];

  // List<String> questions =[
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.'
  // ];
  //
  // List<bool>answer =[
  //   false,true,true
  // ];
  //
  // Question q1 = Question(s:'You can lead a cow down stairs but not up stairs.',a : false);

  List<Question> questionBank = <Question>[
    Question(s:  'You can lead a cow down stairs but not up stairs.',a: false),
    Question(s:'Approximately one quarter of human bones are in the feet.',a: true),
    Question(s:'A slug\'s blood is green.',a: true)

  ];

  int queNum = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
               questionBank[queNum].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                bool correctNum = questionBank[queNum].questionAnswer;
                if(correctNum==true){
                  print('User get it Right');
                }
                else{
                  print('User get it wrong');
                }
                //The user picked true.
                setState(() {
                  queNum++;
                });

              },

            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.redAccent,
                ),
              ),
              onPressed: () {
                bool correctNum = questionBank[queNum].questionAnswer;
                if(correctNum==false){
                  print('User get it Right');
                }
                else{
                  print('User get it wrong');
                }
                setState(() {
                  queNum++;
                });//we use because after updating we want whole program to run again
                //The user picked false.

              },
            ),
          ),
        ),

        Row(
          children:scoreKeeper,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
