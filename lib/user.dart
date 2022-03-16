import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hear_it_through/conversion.dart';
import 'package:hear_it_through/profile.dart';

class userPage extends StatefulWidget {
  const userPage({Key? key}) : super(key: key);

  @override
  _userPageState createState() => _userPageState();
}

class _userPageState extends State<userPage> {

  final FirebaseAuth _auth =  FirebaseAuth.instance;
  late User user;
  bool isloggedin = false;

  checkAuthentification() async{

    _auth.authStateChanges().listen((user){
      if(user== null)
      {
        Navigator.push(context,MaterialPageRoute(builder: (context)=> Profile()));
      }
    });
  }

  signOut() async{
    _auth.signOut();
  }

  getUser() async
  {
    User? firebaseUser = await _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = await _auth.currentUser;

    if(firebaseUser !=null)
      {
        setState(() {
          this.user = firebaseUser!;
          this.isloggedin = true;
        });
      }
  }

  @override

  void initState()
  {
    super.initState();
    this.checkAuthentification();
  }


  dashboard() async{
    Navigator.push(context, MaterialPageRoute(builder: (context)=> Conversion()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Conversion()));
          },
          icon: Icon(
            Icons.close,
            color: Colors.grey,
          ),
        ),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 170,
                      color: Colors.blue,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Align(
                    alignment: Alignment.center,
                    child:PhysicalModel(
                      color: Colors.white,
                      elevation: 8,
                      shadowColor: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                          width: 280,
                          height: 190,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0, bottom: 14.0,),
                                child: CircleAvatar(
                                  radius: 50.0,
                                  backgroundColor: Colors.grey,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 2.0),
                                child: Text(
                                  '${user.displayName}',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  '${user.email}',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16.0,
                                    // fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),),
                              )
                            ],
                          )
                      ),
                    ),),
                )
              ],
            ),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(top:50.0,left:40 ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 20.0,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.dashboard,
                        color: Colors.white,),
                    ),
                    SizedBox(
                      width: 23.0,
                    ),
                    Text(
                      'Dashboard',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),),
                  ],
                ),
              ),
              onTap: dashboard,),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(top:30.0,left:40 ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 20.0,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.info,
                        color: Colors.white,),
                    ),
                    SizedBox(
                      width: 23.0,
                    ),
                    Text(
                      'About Us',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),),
                  ],
                ),
              ),
              // onTap: dashboard,
            ),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(top:30.0,left:40 ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 20.0,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.question_answer,
                        color: Colors.white,),
                    ),
                    SizedBox(
                      width: 23.0,
                    ),
                    Text(
                      'FAQ',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),),
                  ],
                ),
              ),
              // onTap: dashboard,
            ),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(top:30.0,left:40 ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 20.0,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.support_agent,
                        color: Colors.white,),
                    ),
                    SizedBox(
                      width: 23.0,
                    ),
                    Text(
                      'Help/Support',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),),
                  ],
                ),
              ),
              // onTap: dashboard,
            ),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(top:30.0,left:40 ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 20.0,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.logout,
                        color: Colors.white,),
                    ),
                    SizedBox(
                      width: 23.0,
                    ),
                    Text(
                      'Log out',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),),
                  ],
                ),
              ),
              onTap: signOut,
            )
          ],
        ),
      ),
    );
  }
}


