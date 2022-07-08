import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class Conver extends StatefulWidget {
  const Conver({Key? key}) : super(key: key);

  @override
  _ConverState createState() => _ConverState();
}

List<String> isGif = [
  'any questions',
  'are you angry',
  'are you busy',
  'are you hungry',
  'are you sick',
  'be careful',
  'can we meet tomorrow',
  'did you book tickets',
  'did you finish homework',
  'do you go to office',
  'do you have money',
  'do you want something to drink',
  'do you want tea or coffee',
  'do you watch TV',
  'dont worry',
  'flower is beautiful',
  'good afternoon',
  'good evening',
  'good morning',
  'good night',
  'good question',
  'had your lunch',
  'happy journey',
  'hello what is your name',
  'how many people are there in your family',
  'i am a clerk',
  'i am bore doing nothing',
  'i am fine',
  'i am sorry',
  'i am thinking',
  'i am tired',
  'i dont understand anything',
  'i go to a theatre',
  'i love to shop',
  'i had to say something but i forgot',
  'i have headache',
  'i like pink colour',
  'i live in nagpur',
  'lets go for lunch',
  'my mother is a homemaker',
  'my name is john',
  'nice to meet you',
  'no smoking please',
  'open the door',
  'please call me later',
  'please clean the room',
  'please give me your pen',
  'please use dustbin dont throw garbage',
  'please wait for sometime',
  'shall I help you',
  'shall we go together tommorow',
  'sign language interpreter',
  'sit down',
  'stand up',
  'take care',
  'there was traffic jam',
  'wait I am thinking',
  'what are you doing',
  'what is the problem',
  'what is todays date',
  'what is your father do',
  'what is your job',
  'what is your mobile number',
  'what is your name',
  'whats up',
  'when is your interview',
  'when we will go',
  'where do you stay',
  'where is the bathroom',
  'where is the police station',
  'you are wrong',
  'address',
  'agra',
  'ahemdabad',
  'all',
  'april',
  'assam',
  'august',
  'australia',
  'badoda',
  'banana',
  'banaras',
  'banglore',
  'bihar',
  'bihar',
  'bridge',
  'cat',
  'chandigarh',
  'chennai',
  'christmas',
  'church',
  'clinic',
  'coconut',
  'crocodile',
  'dasara',
  'deaf',
  'december',
  'deer',
  'delhi',
  'dollar',
  'duck',
  'febuary',
  'friday',
  'fruits',
  'glass',
  'grapes',
  'gujrat',
  'hello',
  'hindu',
  'hyderabad',
  'india',
  'january',
  'jesus',
  'job',
  'july',
  'july',
  'karnataka',
  'kerala',
  'krishna',
  'litre',
  'mango',
  'may',
  'mile',
  'monday',
  'mumbai',
  'museum',
  'muslim',
  'nagpur',
  'october',
  'orange',
  'pakistan',
  'pass',
  'police station',
  'post office',
  'pune',
  'punjab',
  'rajasthan',
  'ram',
  'restaurant',
  'saturday',
  'september',
  'shop',
  'sleep',
  'southafrica',
  'story',
  'sunday',
  'tamil nadu',
  'temperature',
  'temple',
  'thursday',
  'toilet',
  'tomato',
  'town',
  'tuesday',
  'usa',
  'village',
  'voice',
  'wednesday',
  'weight',
  'please wait for sometime',
  'what is your mobile number',
  'what are you doing',
  'are you busy'
];

List<String> arr = [
  'a',
  'b',
  'c',
  'd',
  'e',
  'f',
  'g',
  'h',
  'i',
  'j',
  'k',
  'l',
  'm',
  'n',
  'o',
  'p',
  'q',
  'r',
  's',
  't',
  'u',
  'v',
  'w',
  'x',
  'y',
  'z'
];
List<String> result = [];

class _ConverState extends State<Conver> {
  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = '';

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    bool available = await _speechToText.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'));
    if (available) {
      setState(() {
        _speechEnabled = true;
      });
      _speechToText.listen(
        onResult: (val) => setState(() {
          _lastWords = val.recognizedWords;
          result = isl(_lastWords);
        }),
      );
    } else {
      setState(() {
        _speechEnabled = false;
        _speechToText.stop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signify'),
        centerTitle: true,
        backgroundColor: const Color(0xff115CB7),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          bottom: 10.0,
        ),
        child: AvatarGlow(
          animate: _speechEnabled,
          glowColor: Colors.blue,
          endRadius: 80,
          duration: const Duration(milliseconds: 2000),
          repeatPauseDuration: const Duration(milliseconds: 100),
          repeat: true,
          child: FloatingActionButton(
            onPressed: () => _initSpeech(),
            child: Icon(_speechEnabled ? Icons.mic : Icons.mic_none),
          ),
        ),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.45), BlendMode.dstATop),
                image: const NetworkImage(
                    "https://thumbs.dreamstime.com/b/vector-deaf-mute-sign-language-character-gesture-men-women-showing-basic-symbol-smiling-sketch-female-male-hand-communication-134983662.jpg"),
                fit: BoxFit.cover),
          ),
          // margin: EdgeInsets.only(left: 5.0),
          child: Padding(
            padding: const EdgeInsets.only(
                bottom: 25.0, left: 25.0, right: 25.0, top: 50.0),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      for (var i in result) Image.asset(i)
                      // Container(
                      //   child: Image.asset(isl(_lastWords)!='null' ? 'images/'+isl(_lastWords): 'images/432008031_FOLDED_HANDS_3D_LIGHT_SKIN_TONE_400px.gif'),
                      // ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List<String> isl(String _lastwrds) {
  if (isGif.contains(_lastwrds)) {
    print(['images/' + _lastwrds + '.gif']);
    return ['images/' + _lastwrds + '.gif'];
  }

  List<String> finalList = [];
  List<String> words = _lastwrds.split('');
  for (var j in words) {
    if (arr.contains(j)) {
      finalList += ['images/practice/' + j + '.jpg'];
    }
  }
  print(finalList);
  return finalList;
}
  // for(var j in _lastwrds.split('') ){
  //   Image.asset('images/'+j+'.jpg');
  // }
  //   return 'null';

