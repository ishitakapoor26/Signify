import 'package:flutter/material.dart';
import 'package:hear_it_through/conver.dart';
import 'package:hear_it_through/conversion.dart';
import 'package:hear_it_through/practice.dart';


class result_quiz extends StatefulWidget {
  int totalScore, questionIndex;
  result_quiz({required this.totalScore, required this.questionIndex});
  // const result_quiz({Key? key}) : super(key: key);

  @override
  State<result_quiz> createState() => _result_quizState();
}

class _result_quizState extends State<result_quiz> {

  var questionIndex;
  var totalScore;

  void initState(){
    totalScore= widget.totalScore;
    questionIndex= widget.questionIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signify',),
        centerTitle: true,
        backgroundColor: Color(0xff115CB7),
        leading:IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Conversion()));
    }
    ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                totalScore>32?Image.asset('assets/stustrenght.ca6e7952-removebg-preview.png'):Image.asset('assets/result-removebg-preview.png'),
                // SizedBox(
                //   height: 5.0,
                // ),
                Text('You have a total score of ${totalScore} points. \nKeep up the good work!',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),),
                SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){
                      setState(() {
                        totalScore=0;
                        questionIndex=1;
                      });
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Practice()));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        textStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                    child: Text(
                      'Practice Again'
                    ),
                    ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){
                      setState(() {
                        totalScore=0;
                        questionIndex=1;
                      });
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Conversion()));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        textStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                    child: Text(
                        'Go Home'
                    ),
                  ),
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
