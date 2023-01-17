import 'QuestionCls.dart';

class QuizBrain {
  int count = 0;
  var current_question;
  var current_answer;

  List<QuestionCls> questionBank = [];
  List<Map> questionMap = [
    {
      'question': 'The Atlantic Ocean is the biggest ocean on Earth.',
      'answer': 'False'
    },
    {'question': 'The human body has four lungs.', 'answer': 'False'},
    {
      'question': 'Atoms are most stable when their outer shells are full.',
      'answer': 'True'
    },
    {'question': 'Venus is the closest planet to the Sun.', 'answer': 'False'},
    {
      'question':
          'Molecules can have atoms from more than one chemical element.',
      'answer': 'True'
    },
  ];

  void displayQuestions() {
    for (int id = 0; id < questionMap.length - 1; id++) {
      current_question = questionMap[id]['question'];
      current_answer = questionMap[id]['answer'];
      questionBank.add(QuestionCls(current_question, current_answer));
    }
  }
}