import 'package:flutter/material.dart';
import 'package:hear_it_through/quiz/practice_start.dart';
import 'package:hear_it_through/result/result.dart';

import '../global/global.dart';

class Practice extends StatefulWidget {
  const Practice({Key? key}) : super(key: key);

  @override
  _PracticeState createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {
  // final List<Icon> _scoreTracker = [];
  static int _questionIndex = 0;
  int _totalScore = sharedPreferences.getInt('_totalScore') ?? 0;
  bool choice = false;
  // final int _ttlScore = 0;

  void _after(String score) {
    setState(() {
      choice = true;
      if (score == 'true') {
        _totalScore += 2;
        sharedPreferences.setInt('_totalScore', _totalScore);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Practice",
          style: TextStyle(fontFamily: 'poppins'),
        ),
        backgroundColor: const Color(0xff115CB7),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const BeginPracticeState(),
              ),
            );
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //**************************************************** Question Index ****************************************************************************
              Stack(
                children: [
                  Column(
                    children: [
                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height / 40,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color(0xFF3F4768), width: 2),
                                borderRadius: BorderRadius.circular(50)),
                            child: Stack(
                              children: [
                                LayoutBuilder(
                                  builder: (context, constraints) => Container(
                                    width: constraints.maxWidth *
                                        (_questionIndex + 1) /
                                        26,
                                    decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Colors.cyan,
                                            Color(0xff115CB7)
                                          ],
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                ),
                                Center(
                                  child: Text('${_questionIndex + 1}/26'),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              //*********************************************************** Score ****************************************************************************
              Center(
                child: Container(
                    decoration: const BoxDecoration(
                        color: Color(0xff115CB7), shape: BoxShape.circle),
                    // color: Colors.blueAccent,
                    //"$_totalScore\nScore"
                    height: 65,
                    width: 65,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${sharedPreferences.getInt('_totalScore') ?? "$_totalScore "}',
                          style: const TextStyle(
                            fontSize: 24.0,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          'Score',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )),
              ),

              //********************************************************* Quiz Part ****************************************************************************

              Container(
                width: double.infinity,
                // height: MediaQuery.of(context).size.height/5,

                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: const Color(0xff115CB7),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(children: [
                  Center(
                      child: Text(
                    _questions[_questionIndex]['question'].toString(),
                    style: const TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontFamily: 'poppins'),
                  )),
                  Image.asset(_questions[_questionIndex]['image'].toString())
                ]),
              ),
              ...(_questions[_questionIndex]['answers']
                      as List<Map<String, Object>>)
                  .map(
                (answer) => Answer(
                  answerText: answer['answerText'].toString(),
                  answerColor: choice
                      ? answer['score'] == true
                          ? Colors.green
                          : Colors.red
                      : Colors.white,
                  click: () {
                    _after(answer['score'].toString());
                  },
                ),
              ),
//**************************************************************** Next Button  **********************************************************************
              InkWell(
                onTap: () {
                  setState(() {
                    if (_questionIndex < _questions.length - 1) {
                      _questionIndex++;
                      choice = false;
                    } else {
                      // _ttlScore=_totalScore;
                      // _totalScore=0;
                      _questionIndex = 0;
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Resultquiz(
                          totalScore: _totalScore,
                          //questionIndex: _questionIndex,
                        ),
                      ));
                    }
                  });
                },
                child: Container(
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: const Color(0xff115CB7),
                      borderRadius: BorderRadius.circular(10)),
                  height: MediaQuery.of(context).size.height / 17,
                  width: MediaQuery.of(context).size.width,
                  child: const Center(
                      child: Text(
                    "Next",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'poppins',
                        color: Colors.white),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Answer extends StatelessWidget {
  final String answerText;
  final Color answerColor;
  final void Function() click;
  const Answer({
    Key? key,
    required this.answerText,
    required this.answerColor,
    required this.click,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: click,
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            color: answerColor,
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          answerText,
          style: const TextStyle(
              fontSize: 20, fontFamily: 'poppins', fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

const _questions = [
  {
    'question': 'What do you mean by the following hand gesture? \n ',
    'image': 'images/Practice Images/d.jpg',
    'answers': [
      {'answerText': 'H', 'score': false},
      {'answerText': 'K', 'score': false},
      {'answerText': 'D', 'score': true},
    ],
  },
  {
    'question': 'What do you mean by the following hand gesture? \n ',
    'image': 'images/Practice Images/e.jpg',
    'answers': [
      {'answerText': 'O', 'score': false},
      {'answerText': 'E', 'score': true},
      {'answerText': 'W', 'score': false},
    ],
  },
  {
    'question': 'What do you mean by the following hand gesture? \n ',
    'image': 'images/Practice Images/f.jpg',
    'answers': [
      {'answerText': 'F', 'score': true},
      {'answerText': 'J', 'score': false},
      {'answerText': 'G', 'score': false},
    ],
  },
  {
    'question': 'What do you mean by the following hand gesture? \n ',
    'image': 'images/Practice Images/g.jpg',
    'answers': [
      {'answerText': 'G', 'score': true},
      {'answerText': 'A', 'score': false},
      {'answerText': 'C', 'score': false},
    ],
  },
  {
    'question': 'What do you mean by the following hand gesture? \n ',
    'image': 'images/Practice Images/a.jpg',
    'answers': [
      {'answerText': 'B', 'score': false},
      {'answerText': 'A', 'score': true},
      {'answerText': 'C', 'score': false},
    ],
  },
  {
    'question': 'What do you mean by the following hand gesture? \n ',
    'image': 'images/Practice Images/z.jpg',
    'answers': [
      {'answerText': 'J', 'score': false},
      {'answerText': 'Z', 'score': true},
      {'answerText': 'A', 'score': false},
    ],
  },
  {
    'question': 'What do you mean by the following hand gesture? \n ',
    'image': 'images/Practice Images/c.jpg',
    'answers': [
      {'answerText': 'N', 'score': false},
      {'answerText': 'L', 'score': false},
      {'answerText': 'C', 'score': true},
    ],
  },
  {
    'question': 'What do you mean by the following hand gesture? \n ',
    'image': 'images/Practice Images/i.jpg',
    'answers': [
      {'answerText': 'K', 'score': false},
      {'answerText': 'O', 'score': false},
      {'answerText': 'I', 'score': true},
    ],
  },
  {
    'question': 'What do you mean by the following hand gesture? \n ',
    'image': 'images/Practice Images/j.jpg',
    'answers': [
      {'answerText': 'M', 'score': false},
      {'answerText': 'J', 'score': true},
      {'answerText': 'Y', 'score': false},
    ],
  },
  {
    'question': 'What do you mean by the following hand gesture? \n ',
    'image': 'images/Practice Images/k.jpg',
    'answers': [
      {'answerText': 'K', 'score': true},
      {'answerText': 'O', 'score': false},
      {'answerText': 'M', 'score': false},
    ],
  },
  {
    'question': 'What do you mean by the following hand gesture? \n ',
    'image': 'images/Practice Images/m.jpg',
    'answers': [
      {'answerText': 'M', 'score': true},
      {'answerText': 'N', 'score': false},
      {'answerText': 'A', 'score': false},
    ],
  },
  {
    'question': 'What do you mean by the following hand gesture? \n ',
    'image': 'images/Practice Images/n.jpg',
    'answers': [
      {'answerText': 'M', 'score': false},
      {'answerText': 'Z', 'score': false},
      {'answerText': 'N', 'score': true},
    ],
  },
  {
    'question': 'What do you mean by the following hand gesture? \n ',
    'image': 'images/Practice Images/o.jpg',
    'answers': [
      {'answerText': 'O', 'score': true},
      {'answerText': 'L', 'score': false},
      {'answerText': 'C', 'score': false},
    ],
  },
  {
    'question': 'What do you mean by the following hand gesture? \n ',
    'image': 'images/Practice Images/h.jpg',
    'answers': [
      {'answerText': 'H', 'score': true},
      {'answerText': 'X', 'score': false},
      {'answerText': 'P', 'score': false},
    ],
  },
  {
    'question': 'What do you mean by the following hand gesture? \n ',
    'image': 'images/Practice Images/l.jpg',
    'answers': [
      {'answerText': 'X', 'score': false},
      {'answerText': 'L', 'score': true},
      {'answerText': 'Y', 'score': false},
    ],
  },
  {
    'question': 'What do you mean by the following hand gesture? \n ',
    'image': 'images/Practice Images/b.jpg',
    'answers': [
      {'answerText': 'B', 'score': true},
      {'answerText': 'P', 'score': false},
      {'answerText': 'M', 'score': false},
    ],
  },
  {
    'question': 'What do you mean by the following hand gesture? \n ',
    'image': 'images/Practice Images/x.jpg',
    'answers': [
      {'answerText': 'Q', 'score': false},
      {'answerText': 'X', 'score': true},
      {'answerText': 'B', 'score': false},
    ],
  },
  {
    'question': 'What do you mean by the following hand gesture? \n ',
    'image': 'images/Practice Images/p.jpg',
    'answers': [
      {'answerText': 'D', 'score': false},
      {'answerText': 'P', 'score': true},
      {'answerText': 'T', 'score': false},
    ],
  },
  {
    'question': 'What do you mean by the following hand gesture? \n ',
    'image': 'images/Practice Images/q.jpg',
    'answers': [
      {'answerText': 'M', 'score': false},
      {'answerText': 'J', 'score': false},
      {'answerText': 'Q', 'score': true},
    ],
  },
  {
    'question': 'What do you mean by the following hand gesture? \n ',
    'image': 'images/Practice Images/s.jpg',
    'answers': [
      {'answerText': 'S', 'score': true},
      {'answerText': 'V', 'score': false},
      {'answerText': 'Q', 'score': false},
    ],
  },
  {
    'question': 'What do you mean by the following hand gesture? \n ',
    'image': 'images/Practice Images/t.jpg',
    'answers': [
      {'answerText': 'U', 'score': false},
      {'answerText': 'Z', 'score': false},
      {'answerText': 'T', 'score': true},
    ],
  },
  {
    'question': 'What do you mean by the following hand gesture? \n ',
    'image': 'images/Practice Images/u.jpg',
    'answers': [
      {'answerText': 'U', 'score': true},
      {'answerText': 'J', 'score': false},
      {'answerText': 'Y', 'score': false},
    ],
  },
  {
    'question': 'What do you mean by the following hand gesture? \n ',
    'image': 'images/Practice Images/r.jpg',
    'answers': [
      {'answerText': 'R', 'score': true},
      {'answerText': 'E', 'score': false},
      {'answerText': 'Y', 'score': false},
    ],
  },
  {
    'question': 'What do you mean by the following hand gesture? \n ',
    'image': 'images/Practice Images/v.jpg',
    'answers': [
      {'answerText': 'M', 'score': false},
      {'answerText': 'V', 'score': true},
      {'answerText': 'A', 'score': false},
    ],
  },
  {
    'question': 'What do you mean by the following hand gesture? \n ',
    'image': 'images/Practice Images/w.jpg',
    'answers': [
      {'answerText': 'G', 'score': false},
      {'answerText': 'R', 'score': false},
      {'answerText': 'W', 'score': true},
    ],
  },
  {
    'question': 'What do you mean by the following hand gesture? \n ',
    'image': 'images/Practice Images/y.jpg',
    'answers': [
      {'answerText': 'H', 'score': false},
      {'answerText': 'Y', 'score': true},
      {'answerText': 'C', 'score': false},
    ],
  },
];
