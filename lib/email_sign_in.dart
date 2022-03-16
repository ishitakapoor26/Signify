import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hear_it_through/profile.dart';
import 'package:hear_it_through/sign_up.dart';
import 'package:hear_it_through/user.dart';

class Email_Sign_In extends StatefulWidget {
  const Email_Sign_In({Key? key}) : super(key: key);

  @override
  _Email_Sign_InState createState() => _Email_Sign_InState();
}

class _Email_Sign_InState extends State<Email_Sign_In> {

FirebaseAuth _auth =  FirebaseAuth.instance;
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

late String _email, _password;

checkAuthentification() async{

  _auth.authStateChanges().listen((user){
    if(user!= null)
      {
        Navigator.push(context,MaterialPageRoute(builder: (context)=> userPage()));
      }
  });
}

@override

void initState()
{
  super.initState();
  this.checkAuthentification();
}

login() async {
  if(_formKey.currentState!.validate()){
    _formKey.currentState!.save();
    try{
      await _auth.signInWithEmailAndPassword(email: _email, password: _password);
    }
    catch(e){
      showError(e.toString());
      print(e);
    }
  }
}

showError(String errormessage){
  
  showDialog(context: context,
      builder: (BuildContext context)
  {
    return AlertDialog(
    title: Text('ERROR'),
  content: Text(errormessage),
  actions: <Widget>[
    TextButton(
  onPressed: (){
  Navigator.of(context).pop();
  },
  child: Text('OK'))
  ],
    );
  });
}

navigateToSignUp() async{
  Navigator.push(context,MaterialPageRoute(builder: (context) => Sign_up()));
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Profile()));
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
        child: Container(
        child: Column(
          children: <Widget>[
            Container(
              
              height: 250,
              child: Image.asset('images/istockphoto-1281150061-612x612-removebg-preview.png'),
            ),
            Container(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 10.0, left: 28.0, right: 28.0),
                    child: Container(
                      child: TextFormField(
                        validator: (input)
                          {
                          if(input!.isEmpty){
                          return 'Enter Email';
                          }
                          },
                               decoration :InputDecoration(
                                  label: Text('Email'),
                                  prefixIcon: Icon(Icons.email)
                                ),
                              onSaved: (input) => _email=input!),
                            ),),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0, left: 28.0, right: 28.0),
                      child: Container(
                          child: TextFormField(
                              validator: (input)
                                {
                                if(input!.length <6)
                                {
                                return 'Provide Minimum 6 Character';
                                }
                                },
                                decoration :InputDecoration(
                                    label: Text('Password'),
                                    prefixIcon: Icon(Icons.lock)
                                ),
                                obscureText: true,
                                onSaved: (input) => _password=input!),

                          ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 18.0, left: 28.0, right: 28.0),
                      child: FractionallySizedBox(
                        widthFactor: 1,
                        child: ElevatedButton(
                        onPressed: (){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => userPage()));
                        },
                      child: Text('Sign in',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding: EdgeInsets.all(8.0),
                      ),),
                    ),),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GestureDetector(
                        child: RichText(
                          text: TextSpan(
                            text: 'Not Registered? ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                              color: Colors.black,
                            ),
                            children: const <TextSpan>[
                              TextSpan(text: 'Sign up', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.blue)),
                            ],
                          ),
                        ),
                        onTap: navigateToSignUp,
                      ),
                    )
                  ],
                )
              ),
            )
          ],
        ),
      ),
    ),);
  }
}