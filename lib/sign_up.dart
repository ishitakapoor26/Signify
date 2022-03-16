import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hear_it_through/conver.dart';
import 'package:hear_it_through/conversion.dart';
import 'package:hear_it_through/profile.dart';
import 'package:hear_it_through/user.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Sign_up extends StatefulWidget {
  const Sign_up({Key? key}) : super(key: key);

  @override
  _Sign_upState createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String _email, _password, _name;

  checkAuthentification() async{

    _auth.authStateChanges().listen((user){
      if(user!= null)
      {
        Navigator.push(this.context,MaterialPageRoute(builder: (context)=>userPage()));
      }
    });
  }

  @override

  void initState()
  {
    super.initState();
    this.checkAuthentification();
  }

  signUp() async{
    if(_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
    try{
      UserCredential user = await _auth.signInWithEmailAndPassword(email: _email, password: _password);
      if(user!=null)
        {
          await _auth.currentUser!.updateDisplayName(_name);
        }

    }
    catch(e){
      showError(e.toString());
      print(e);
    }
  }

  showError(String errormessage){

    showDialog(context: this.context,
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

  File? image;

  Future pickImage() async{
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image==null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image= imageTemporary;
      });
    }
    on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future uploadPic(BuildContext context) async{
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref= storage.ref().child("image"+DateTime.now().toString());
    UploadTask uploadTask=ref.putFile(image!);
    uploadTask.then((res){
      res.ref.getDownloadURL();
    });
    setState(() {
      print('Profile picture uploaded');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
    });
  }

  navigateToSignIn() async{
     Navigator.push(this.context, MaterialPageRoute(builder: (context) => Profile()));
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
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
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            Stack(
            children: <Widget>[
            Align(
          alignment: Alignment.topCenter,
          child:Container(
          child: Padding(
          padding: EdgeInsets.only(top: 40.0,),
          child:CircleAvatar(
          radius: 70.0,
          backgroundColor: Colors.indigo,
          child: ClipOval(
          child: (image!=null)?Image.file(image!, fit: BoxFit.fill,):
          Image.network("https://www.whatsappprofiledpimages.com/wp-content/uploads/2021/11/Beautiful-Sweet-Profile-Dp-For-Whatsapp-Images-pics-2.jpg"),
          )

          ),
          ),),),
          Positioned(
          right: 100.0,
          bottom: 5.0,
          child: Container(
          // color: Colors.white,
          decoration:new BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
          ),
          child: IconButton(
          icon: Icon(
          Icons.camera,
          size:30.0,
          color: Colors.white,
          ),

          onPressed: (){
          pickImage();
          uploadPic(context);
          }
          )
          ),),
            ],),
               Container(
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[

                          Padding(
                            padding: const EdgeInsets.only(top: 25.0,bottom: 10.0, left: 28.0, right: 28.0),
                            child: Container(
                              child: TextFormField(
                                  validator: (input)
                                  {
                                    if(input!.isEmpty)
                                    {
                                      return 'Enter Name';
                                    }
                                  },
                                  decoration :InputDecoration(
                                      label: Text('Name'),
                                      prefixIcon: Icon(Icons.person)
                                  ),
                                  onSaved: (input) => _name=input!),

                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only( bottom: 10.0, left: 28.0, right: 28.0),
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
                            ),
                          ),
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
                              onPressed: (){},
                              child: Text('Sign up',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                                padding: EdgeInsets.all(8.0)
                              ),),
                          )
                          ),
                   Padding(
                     padding: const EdgeInsets.all(12.0),
                     child: GestureDetector(
                       child: RichText(
                         text: TextSpan(
                           text: 'Already Registered? ',
                           style: TextStyle(
                             fontWeight: FontWeight.w500,
                             fontFamily: 'Poppins',
                             color: Colors.black,
                           ),
                           children: const <TextSpan>[
                             TextSpan(text: 'Sign in', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins', color: Colors.blue)),
                           ],
                         ),
                       ),
                       onTap: navigateToSignIn,
                     ),
                   ),],
                      )
                  ),
                ),
          ],
          ),
          ),);
        }
}
