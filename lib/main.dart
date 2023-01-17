import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'QuizBrain.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MaterialApp(home: QuizzlerApp()));
}

class QuizzlerApp extends StatefulWidget {
  const QuizzlerApp({Key? key}) : super(key: key);

  @override
  State<QuizzlerApp> createState() => _QuizzlerAppState();
}

class _QuizzlerAppState extends State<QuizzlerApp> {
  QuizBrain quizBrain = QuizBrain();
  List<Widget> symbols = [];
  int count = 0;
  int score = 0;
  String printQues = '';

  void buttonclick(String userAns) {
    setState(() {
      if (count == quizBrain.questionMap.length - 1) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.grey.shade900,
            title: Text(
              'Quiz Over! \n Your Score is: $score',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'SourceSansPro',
                letterSpacing: 2.5,
                fontSize: 25,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      }
      if (count <= quizBrain.questionMap.length - 1) {
        if (quizBrain.questionMap[count]['answer'] == userAns) {
          score++;
          count++;
          symbols.add(
            const Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          count++;
          symbols.add(const Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (count <= quizBrain.questionMap.length - 1) {
      printQues = quizBrain.questionMap[count]['question'];
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  exit(0);
                },
                icon: Icon(
                  Icons.close_outlined,
                  color: Colors.red,
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.white),
                )),
          ],
          title: const Text(
            'QUIZZLER',
            style: TextStyle(
              fontFamily: 'LuckiestGuy',
              letterSpacing: 2.5,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey.shade900,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Text(
                    printQues.toUpperCase(),
                    style: const TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SourceSansPro',
                      letterSpacing: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green),
                  ),
                  onPressed: () {
                    buttonclick('True');
                  },
                  child: const Text(
                    'TRUE',
                    style: TextStyle(
                      color: Color(0xFFEEEEEE),
                      fontFamily: 'SourceSansPro',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.5,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.red)),
                  onPressed: () => buttonclick('False'),
                  child: const Text(
                    'FALSE',
                    style: TextStyle(
                      color: Color(0xFFEEEEEE),
                      fontFamily: 'SourceSansPro',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.5,
                    ),
                  ),
                ),
              ),
            ),
            Row(children: [for (var item in symbols) item])
          ],
        ),
      ),
    );
  }
}