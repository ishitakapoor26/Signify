import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hear_it_through/conversion.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class IntroSliderPage extends StatefulWidget {
  const IntroSliderPage({Key? key}) : super(key: key);

  @override
  _IntroSliderPageState createState() => _IntroSliderPageState();
}

class _IntroSliderPageState extends State<IntroSliderPage> {

  List<Slide> slides=[];

  @override
   void initState(){
    super.initState();
    slides.add(new Slide(
      title: "Hi there!",
      styleTitle: TextStyle(
        color: Colors.indigo,
        fontFamily: 'Poppins',
        fontSize: 40.0,
        fontWeight: FontWeight.w700,
      ),
      description:"Hello, I'm Signify's\nvirtual translator of sign\nlanguage and I will help you.",
      styleDescription: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18.0,
        color: Colors.blue,
      ),
      pathImage: "images/432008031_FOLDED_HANDS_3D_LIGHT_SKIN_TONE_400px.gif",
    ));
    slides.add(new Slide(
      title: "About App",
      styleTitle: TextStyle(
        color: Colors.indigo,
        fontFamily: 'Poppins',
        fontSize: 40.0,
        fontWeight: FontWeight.w700,
      ),
      description:"Signify uses NLP\nto translate speech to ISL\nand helps you learn and\nunderstand sign language." ,
      styleDescription: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 18.0,
        color: Colors.blue,
      ),
      pathImage: "images/istockphoto-1316073865-612x612.jpg",
    ));
    slides.add(new Slide(
      title: "How It Works",
      styleTitle: TextStyle(
        color: Colors.indigo,
        fontFamily: 'Poppins',
        fontSize: 40.0,
        fontWeight: FontWeight.w700,
      ),
      description:"The app uses Natural Language\nProcessing (NLP) to translate\nfrom English to ISL.\nIt means that input\nspeech will be converted\nto text and matching sign\nlanguage interpretation will\nbe shown.",
      styleDescription: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16.0,
        color: Colors.blue,
      ),

      pathImage: "images/istockphoto-1226921545-612x612.jpg",
    ));
  }
  void onDonePress() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Conversion()));
  }
  void onSkipPress() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Conversion()));
  }

  List<Widget> renderListCustomTabs(){
    List<Widget> tabs=[];
    for (int i=0;i<slides.length;i++){
      Slide currentSlide = slides[i];
      tabs.add(Container(width: double.infinity,
      height: double.infinity,
      child: Container(
        margin: EdgeInsets.only(bottom: 100, top: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
              ),
              child: CircleAvatar(
                radius: 120.0,
                backgroundImage: AssetImage(currentSlide.pathImage ?? " "),
                backgroundColor: Colors.transparent,
              ),

            ),
            Container(
              child: Text(currentSlide.title ?? " ",
              style: TextStyle(
                color: Colors.indigo,
                fontFamily: 'Poppins',
                fontSize: 35.0,
                fontWeight: FontWeight.w700,
              ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(currentSlide.description ?? " ",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16.0,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              ),
              margin: EdgeInsets.only(top: 15, left: 20, right: 20),
            )
          ],
        ),
      ),));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      backgroundColorAllSlides: Colors.white,
      renderSkipBtn: Text("Skip",
      style: TextStyle(
        fontFamily: 'Poppins',
        color: Colors.blue,
        fontWeight: FontWeight.w500,
        fontSize: 15.0,
      )),
      renderNextBtn: Text("Next",
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
          )),
      renderDoneBtn:

      Text("Done",
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
          )),
      colorDoneBtn: Colors.blue,
      colorActiveDot: Colors.blue,
      sizeDot: 8.0,
      typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,
      listCustomTabs: this.renderListCustomTabs(),
      onDonePress: this.onDonePress,
        onSkipPress: this.onSkipPress,
    scrollPhysics: BouncingScrollPhysics(),
      hideStatusBar: false,
    );
  }
}
