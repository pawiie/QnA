import 'package:flutter/material.dart';
import 'package:qna/question.dart';

void main() {
  runApp(QNA());
}

class QNA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: QnaPage(),
          ),
        ),
      ),
    );
  }
}

class QnaPage extends StatefulWidget {
  @override
  _QnaPageState createState() => _QnaPageState();
}

class _QnaPageState extends State<QnaPage> {
  List<Icon> scoreKeeper = [];
  int index = 0;
  List<Question> questions = [
    Question(q: 'Sun revolves around Earth', a: false),
    Question(q: 'New Delhi is the capital of india', a: true),
    Question(q: 'Earth revolves around Sun', a: true),
    Question(q: 'Lucknow is not the capital of Uttar Pradesh', a: false),
    Question(q: 'New York is in America', a: true)
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                questions[index].qtext,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: FlatButton(
              color: Colors.green,
              textColor: Colors.white,
              child: Text(
                "True",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                if (questions[index].qans == true) {
                  setState(() {
                    scoreKeeper.add(Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  });
                } else {
                  setState(() {
                    scoreKeeper.add(Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                  });
                }
                setState(() {
                  index = (index + 1) % 5;
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: FlatButton(
              color: Colors.red,
              textColor: Colors.white,
              child: Text(
                "False",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                if (questions[index].qans == false) {
                  setState(() {
                    scoreKeeper.add(Icon(
                      Icons.check,
                      color: Colors.green,
                    ));
                  });
                } else {
                  setState(() {
                    scoreKeeper.add(Icon(
                      Icons.close,
                      color: Colors.red,
                    ));
                  });
                }
                setState(() {
                  index = (index + 1) % 5;
                });
              },
            ),
          ),
        ),
        //  score keeper
        Expanded(
          child: Row(
            children: scoreKeeper,
          ),
        )
      ],
    );
  }
}
