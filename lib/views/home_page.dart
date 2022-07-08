import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hear_it_through/views/learn.dart';
import 'package:hear_it_through/quiz/practice_start.dart';

import 'text_to_speech.dart';

class Conversion extends StatefulWidget {
  const Conversion({Key? key}) : super(key: key);

  @override
  _ConversionState createState() => _ConversionState();
}

List<Widget> _widgetOptions = <Widget>[
  const Conver(),
  const Learn(),
  const BeginPracticeState(),
  // Profile(),
];

class _ConversionState extends State<Conversion> {
  int _selectedIndex = 0;

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
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              spreadRadius: 2.0,
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.blue[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.blue,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(seconds: 1),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.grey,
              tabs: const [
                GButton(
                  icon: Icons.mic_external_on,
                  text: 'Speech To Sign',
                ),
                GButton(
                  icon: Icons.pending_actions,
                  text: 'Learn',
                ),
                GButton(
                  icon: Icons.quiz_outlined,
                  text: 'Practice/Quiz',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
      // BottomNavigationBar(
      //   elevation: 6.0,
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.mic_external_on,
      //       ),
      //       label: 'Speech To Sign',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.pending_actions,
      //       ),
      //       label: 'Learn',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.quiz_outlined,
      //       ),
      //       label: 'Practice/Quiz',
      //     ),
      //     // BottomNavigationBarItem(
      //     //   icon: Icon(Icons.supervisor_account),
      //     //   label: 'Profile',),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.blue,
      //   unselectedItemColor: Colors.black54,
      //   onTap: _onItemTapped,
      // ),
      body: Center(
        // reverse: true,
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
