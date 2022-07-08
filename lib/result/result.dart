import 'package:flutter/material.dart';
import 'package:hear_it_through/views/home_page.dart';
import 'package:hear_it_through/quiz/practice_main.dart';

import '../global/global.dart';

class Resultquiz extends StatefulWidget {
  final int totalScore;
  const Resultquiz(
      {Key? key, required this.totalScore})
      : super(key: key);
  // const Resultquiz({Key? key}) : super(key: key);

  @override
  State<Resultquiz> createState() => _ResultquizState();
}

class _ResultquizState extends State<Resultquiz> {
  //var questionIndex;
  var totalScore;

  @override
  void initState() {
    totalScore = widget.totalScore;
    //questionIndex = widget.questionIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Signify',
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff115CB7),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const Conversion()));
            }),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                totalScore > 32
                    ? Image.asset(
                        'assets/stustrenght.ca6e7952-removebg-preview.png')
                    : Image.asset('assets/result-removebg-preview.png'),
                // SizedBox(
                //   height: 5.0,
                // ),
                Text(
                  'You have a total score of $totalScore points. \nKeep up the good work!',
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // setState(() {
                      //   totalScore = 0;
                      //   questionIndex = 1;
                      // });
                       sharedPreferences.remove('_totalScore');
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const Practice()));
                          
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        textStyle: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                    child: const Text('Practice Again'),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // setState(() {
                      //   totalScore = 0;
                      //   questionIndex = 1;
                      // });
                       sharedPreferences.remove('_totalScore');
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const Conversion()));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        textStyle: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                    child: const Text('Go Home'),
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
