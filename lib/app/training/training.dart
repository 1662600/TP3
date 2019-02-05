import 'package:flutter/material.dart';
import 'package:tp3/app/hiragana/hiragana.dart';
import 'package:tp3/app/hiragana//symbol.dart';

class Training extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Training();
  }
}

class _Training extends State<Training>{

  String _choice1 = "whee";
  String _choice2 = "whe";
  String _choice3 = "whEE";

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Column(
        children: <Widget>[
          Symbol(value: "WHEEE",),

//          ListView(
//            children: <Widget>[
//              FlatButton(
//                child: Text(_choice1),
//                onPressed: onChoice1ButtonPressed(),
//                textColor: Color.fromARGB(0, 255, 0, 1),
//              ),
//              FlatButton(
//                child: Text(_choice2),
//                onPressed: onChoice2ButtonPressed(),
//              ),
//              FlatButton(
//                child: Text(_choice3),
//                onPressed: onChoice3ButtonPressed(),
//              ),
//            ],
//          ),
        ],
      )
    );
  }

  onChoice1ButtonPressed(){
    setState(() {

    });
  }

  onChoice2ButtonPressed(){
    setState(() {

    });
  }

  onChoice3ButtonPressed(){
    setState(() {

    });
  }
}