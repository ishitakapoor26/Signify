import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hear_it_through/global/global.dart';
import 'package:hear_it_through/splash/intro_slider.dart';

import '../views/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    setTimer();
  }

  void setTimer() {
    Timer(const Duration(seconds: 5), () {
      if (sharedPreferences.getBool('isNew') == true) {
       // print(sharedPreferences.getBool('isNew'));
        //Old User send directly to homepage
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const Conversion(),
          ),
        );
      } else {
        // print(sharedPreferences.getBool('isNew'));
        //New User send through Pageview Builder Splash Screen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const IntroSliderPage(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signify'),
        backgroundColor: const Color(0xff115CB7),
        centerTitle: true,
      ),
      body: Center(
          child: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3),
              BlendMode.dstATop,
            ),
            image: const NetworkImage(
              "https://www.mddionline.com/sites/mddionline.com/files/field/image/Thumbs-Up-Big_Kittikun-Atsawintarangkul.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        margin: const EdgeInsets.only(left: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundImage: NetworkImage(
                  'https://mhcd.org/wp-content/uploads/2019/08/ASL-Icon-2.png'),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              "Signify",
              style: TextStyle(
                fontSize: 35.0,
                color: Color(0xff115CB7),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),
            CircularProgressIndicator(
              backgroundColor: Colors.grey,
              color: Colors.white,
            ),
          ],
        ),
      )),
    );
  }
}
