import 'package:flutter/material.dart';
import 'package:hear_it_through/views/home_page.dart';
import 'package:hear_it_through/quiz/practice_main.dart';

class BeginPracticeState extends StatefulWidget {
  const BeginPracticeState({Key? key}) : super(key: key);

  @override
  State<BeginPracticeState> createState() => _BeginPracticeStateState();
}

class _BeginPracticeStateState extends State<BeginPracticeState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Practice',
          style: TextStyle(fontFamily: 'Poppins'),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff115CB7),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const Conversion()));
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                  'assets/quiz-time-words-splash-paint-letters-vector-colorful-184587550-removebg-preview.png'),
              const SizedBox(
                height: 8.0,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
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
                  child: const Text("Let's Begin!"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
