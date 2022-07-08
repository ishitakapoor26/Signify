import 'dart:core';

import 'package:flutter/material.dart';

class Learn extends StatefulWidget {
  const Learn({Key? key}) : super(key: key);

  @override
  _LearnState createState() => _LearnState();
}

var imgLs = [
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
        title: const Center(
            child: Text(
          'Learn',
          style: TextStyle(fontSize: 25, fontFamily: 'poppins'),
        )),
        backgroundColor: const Color(0xff115CB7),
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: List.generate(imgLs.length, (index) {
          return GridTile(
            child: Tile(
              letter: letters[index],
              img: imgLs[index],
            ),
          );
        }),
      ),
    );
  }
}

class Tile extends StatefulWidget {
  final String letter;
  final String img;
  const Tile({
    Key? key,
    required this.letter,
    required this.img,
  }) : super(key: key);

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
      color: _isExpand ? const Color(0xff115CB7) : Colors.white,
      child: ExpansionTile(
        onExpansionChanged: (value) {
          setState(() {
            _isExpand = value;
          });
        },
        tilePadding: const EdgeInsets.all(10),
        trailing: Icon(
          _isExpand ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
          color: _isExpand ? Colors.white : Colors.black,
        ),
        subtitle: Text(
          _isExpand ? str2 : str1,
          style: TextStyle(
              fontFamily: 'poppins',
              fontSize: 10,
              color: _isExpand ? Colors.white : Colors.black),
        ),
        title: Center(
            child: Text(
          widget.letter,
          style: TextStyle(
              fontSize: 70,
              fontFamily: 'poppins',
              fontWeight: FontWeight.bold,
              color: _isExpand ? Colors.white : Colors.black),
        )),
        children: [
          SizedBox(
            child: Image.asset(widget.img),
          ),
        ],
      ),
    );
  }
}
