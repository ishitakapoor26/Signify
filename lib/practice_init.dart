import 'package:flutter/material.dart';
import 'package:hear_it_through/conversion.dart';
import 'package:hear_it_through/practice.dart';

class beginPractice extends StatefulWidget {
  const beginPractice({Key? key}) : super(key: key);

  @override
  State<beginPractice> createState() => _beginPracticeState();
}

class _beginPracticeState extends State<beginPractice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practice',
          style: TextStyle(fontFamily: 'Poppins'),),
        centerTitle: true,
        backgroundColor: Color(0xff115CB7),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Conversion()) );
          },),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/quiz-time-words-splash-paint-letters-vector-colorful-184587550-removebg-preview.png'),
              SizedBox(
                height: 8.0,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
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
                      "Let's Begin!"
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
