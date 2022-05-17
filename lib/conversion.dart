import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:hear_it_through/learn.dart';
import 'package:hear_it_through/practice.dart';
import 'package:hear_it_through/practice_init.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import 'conver.dart';


class Conversion extends StatefulWidget {
  Conversion({Key? key}) : super(key: key);

  @override
  _ConversionState createState() => _ConversionState();
}

List<Widget> _widgetOptions = <Widget>[
  Conver(),
  Learn(),
  beginPractice(),
  // Profile(),
];

class _ConversionState extends State<Conversion> {
  int _selectedIndex=0;

  @override


  // /// Each time to start a speech recognition session
  // void _startListening() async {
  //   await _speechToText.listen(onResult: _onSpeechResult);
  //   setState(() {});
  // }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  // void _stopListening() async {
  //   await _speechToText.stop();
  //   setState(() {});
  // }
  void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  // void _onSpeechResult(SpeechRecognitionResult result) {
  //   setState(() {
  //     _lastWords = result.recognizedWords;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 6.0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.mic_external_on,),
            label: 'Speech To Sign',),
          BottomNavigationBarItem(
            icon: Icon(Icons.pending_actions,),
            label: 'Learn',),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz_outlined,),
            label: 'Practice/Quiz',),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.supervisor_account),
          //   label: 'Profile',),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black54,
        onTap: _onItemTapped,
      ),
    body: Center(
      // reverse: true,
      child: _widgetOptions.elementAt(_selectedIndex),

    ),);
  }
}