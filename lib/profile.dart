import 'dart:io';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hear_it_through/email_sign_in.dart';
import 'package:hear_it_through/sign_up.dart';
import 'package:hear_it_through/user.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'conversion.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  checkAuthentification() async{

    _auth.authStateChanges().listen((user){
      if(user!= null)
      {
        Navigator.push(this.context,MaterialPageRoute(builder: (context)=> userPage()));
      }
    });
  }

  Future<UserCredential> signWithGoogle() async {
    final GoogleSignInAccount? googleUser =
    await GoogleSignIn(scopes: <String>["email"]).signIn();

    final GoogleSignInAuthentication googleAuth =
    await googleUser!.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

//Facebook
  Future<UserCredential> signInWithFacebook() async {
    final AccessToken result = (await FacebookAuth.instance.login()) as AccessToken;

    final OAuthCredential facebookAuthCredential =
    FacebookAuthProvider.credential(result.token);

    return await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
  }

  @override

  void initState()
  {
    super.initState();
    this.checkAuthentification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Conversion()));
          },
          icon: Icon(
            Icons.close,
            color: Colors.grey,
          ),),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontFamily: 'Poppins',
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.network('https://www.planstudyabroad.uniagents.com/images/login.png',
                height: 220.0,),
              Padding(
                padding: EdgeInsets.only(top:10.0,bottom: 2.0,left: 16.0, right: 16.0,),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child:Text('Sign In',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 22.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                ),
              Padding(
                padding: EdgeInsets.only(top:3.0,bottom: 20.0,left: 16.0, right: 16.0,) ,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    child:Text('You can sign in to the app by email or via social media',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
              Padding(
                      padding: EdgeInsets.only(top: 0, bottom: 8.0, left: 16.0, right: 16.0,),
                      child: FractionallySizedBox(
                          widthFactor: 1,
                          child: ElevatedButton.icon(
                          onPressed:() {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Email_Sign_In()));
                          },
                          icon: Icon(Icons.mail,color: Colors.white,),
                          label: Text('SIGN IN WITH EMAIL',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontSize: 14.0,
                            ),

                            textAlign: TextAlign.center,
                      ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(12.0),
                          primary: Colors.deepOrange,
                          shape: new RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          )
                        ),
                    )
                    ),),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0, left: 16.0, right: 16.0,),
                      child: FractionallySizedBox(
                          widthFactor: 1,
                          child: ElevatedButton.icon(
                            onPressed:() {
                              signWithGoogle().then((UserCredential value){
                                // final displayName = value.user!.displayName;
                                // print(displayName);
                                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> userPage()), (route)=>false);
                              });
                            },
                            icon: Icon(FontAwesomeIcons.google),
                            label: Text('GOOGLE LOGIN',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 14.0,
                              ),

                              textAlign: TextAlign.center,
                            ),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(12.0),
                                primary: Colors.red,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                )
                            ),
                          )
                      ),),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0, left: 16.0, right: 16.0,),
                      child: FractionallySizedBox(
                          widthFactor: 1,
                          child: ElevatedButton.icon(
                            onPressed:() {
                                signInWithFacebook().then((UserCredential value) {
                                  Navigator.pushAndRemoveUntil(
                                      context, MaterialPageRoute(builder: (
                                      context) => userPage()), (
                                      route) => false);
                                });
                            },
                            icon: Icon(FontAwesomeIcons.facebook),
                            label: Text('FACEBOOK LOGIN',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 14.0,
                              ),

                              textAlign: TextAlign.center,
                            ),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(12.0),
                                primary: Colors.indigo,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                )
                            ),
                          ),
                      ),),
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0, left: 16.0, right: 16.0,),
                      child: FractionallySizedBox(
                          widthFactor: 1,
                          child: ElevatedButton.icon(
                            onPressed:() {
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Sign_up()));
                            },
                            icon: Icon(Icons.mail,color: Colors.white,),
                            label: Text('CREATE ACCOUNT',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                                fontSize: 14.0,
                              ),

                              textAlign: TextAlign.center,
                            ),
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(12.0),
                                primary: Colors.white,
                                alignment: Alignment.center,
                                shape: new RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(5.0),
                                )
                            ),
                          )
                      ),),
      ],),),);
  }
}
