import 'package:flutter/material.dart';

import 'dart:core';

class Learn extends StatefulWidget {
  const Learn({Key? key}) : super(key: key);

  @override
  _LearnState createState() => _LearnState();
}

var img_ls = [
  'images/practice/a.jpg',
  'images/practice/b.jpg',
  'images/practice/c.jpg',
  'images/practice/d.jpg',
  'images/practice/e.jpg',
  'images/practice/f.jpg',
  'images/practice/g.jpg',
  'images/practice/h.jpg',
  'images/practice/i.jpg',
  'images/practice/j.jpg',
  'images/practice/k.jpg',
  'images/practice/l.jpg',
  'images/practice/m.jpg',
  'images/practice/n.jpg',
  'images/practice/o.jpg',
  'images/practice/p.jpg',
  'images/practice/q.jpg',
  'images/practice/r.jpg',
  'images/practice/s.jpg',
  'images/practice/t.jpg',
  'images/practice/u.jpg',
  'images/practice/v.jpg',
  'images/practice/w.jpg',
  'images/practice/x.jpg',
  'images/practice/y.jpg',
  'images/practice/z.jpg'
];


List letters = [
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];
class _LearnState extends State<Learn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Center(child: Text('Learn',style: TextStyle(fontSize: 25,fontFamily: 'poppins'),)),
        backgroundColor: Color(0xff115CB7),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: List.generate(img_ls.length, (index) {
          return GridTile(
            child: Tile(
              letter: letters[index],
              img: img_ls[index],
            ),
          );
        }),
      ),
    );
  }
}

class Tile extends StatefulWidget {
  String letter;
  String img;
  Tile({required this.letter, required this.img});

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  bool _isExpand = false;
  String str1 = 'Touch to Expand';
  String str2 = 'Touch to Shrink';

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.blue,
        color: _isExpand?Color(0xff115CB7):Colors.white,

        child: ExpansionTile(
          onExpansionChanged: (value) {
            setState(() {
              _isExpand = value;
            }
            );
          },
          tilePadding: EdgeInsets.all(10),
          trailing: Icon(_isExpand?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down,color:_isExpand?Colors.white:Colors.black,),
          subtitle: Text(_isExpand ? str2:str1,style: TextStyle(fontFamily: 'poppins',fontSize: 10,color: _isExpand?Colors.white:Colors.black),),
          title: Center(
              child: Text(
            widget.letter,
            style: TextStyle(fontSize: 70, fontFamily: 'poppins',fontWeight: FontWeight.bold,color: _isExpand?Colors.white:Colors.black),
          )),
          children: [
            Container(
                child: Image.asset(widget.img)
                )
          ],
        ));
  }
}
