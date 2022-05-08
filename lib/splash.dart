import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hear_it_through/intro_slider.dart';


class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 8),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => IntroSliderPage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signify'),
        backgroundColor: Color(0xff115CB7),
        centerTitle: true,
      ),

      body: Center(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
           image: DecorationImage(
               colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
                  image: NetworkImage("https://www.mddionline.com/sites/mddionline.com/files/field/image/Thumbs-Up-Big_Kittikun-Atsawintarangkul.jpg"), fit: BoxFit.cover),
          ),
          margin: EdgeInsets.only(left: 10.0),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage('https://mhcd.org/wp-content/uploads/2019/08/ASL-Icon-2.png'),
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
            ],),

        )
    ),);
  }
}
