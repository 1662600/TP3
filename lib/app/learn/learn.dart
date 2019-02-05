import 'package:flutter/material.dart';
import 'package:tp3/app/hiragana//symbol.dart';
import 'package:tp3/app/hiragana/hiragana.dart';

class Learn extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
        children: List.generate(Hiraganas.length, (index){
          return Symbol(value: Hiraganas.keys.elementAt(index), translation: Hiraganas.values.elementAt(index),);
        })
    );
  }
}