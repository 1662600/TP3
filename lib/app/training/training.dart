import 'package:flutter/material.dart';
import 'package:tp3/app/hiragana/hiragana.dart';
import 'package:tp3/app/hiragana//symbol.dart';
import 'dart:math';

class Training extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Training();
  }
}

class _Training extends State<Training> {

  static const int _buttonNumber = 3;

  List<String> _choices = List(_buttonNumber);
  List<bool> _buttonsEnabled = List(_buttonNumber);

  String _value = "";
  String _answer = "";

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1,
        child: Column(
          children: <Widget>[
            Symbol(
              value: _value,
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  FlatButton(
                    textColor: _buttonsEnabled.elementAt(0)? Colors.black : Colors.red,
                    child: Text(_choices.elementAt(0)
                    ),
                    onPressed: () =>
                    _buttonsEnabled.elementAt(0)? onChoiceButtonPressed(0) : null,
                  ),
                  FlatButton(
                    textColor: _buttonsEnabled.elementAt(0)? Colors.black : Colors.red,                    child: Text(_choices.elementAt(1)),
                    onPressed: () =>
                    _buttonsEnabled.elementAt(1)? onChoiceButtonPressed(1) : null,
                  ),
                  FlatButton(
                    textColor: _buttonsEnabled.elementAt(0)? Colors.black : Colors.red,                    child: Text(_choices.elementAt(2)),
                    onPressed: () =>
                    _buttonsEnabled.elementAt(2)? onChoiceButtonPressed(2) : null,
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  @override
  void initState() {
    super.initState();
    _initialise();
  }

  onChoiceButtonPressed(int buttonIndex) {
    setState(() {
      print(_choices.elementAt(buttonIndex));
        if (_choices.elementAt(buttonIndex) == _answer)
          _initialise();
        else
          _buttonsEnabled[buttonIndex] = false;
    });
  }

  _getRandomSymbol() =>
      Hiraganas.keys.elementAt(Random().nextInt(Hiraganas.length));

  _getRandomAnswer() =>
      Hiraganas.values.elementAt(Random().nextInt(Hiraganas.length));

  _getAnswer(String symbol) => Hiraganas[symbol];

  _initialiseChoices() {

    int answerIndex = Random().nextInt(_buttonNumber);

    for (int i = 0; i < _buttonNumber; i++) {
      if (answerIndex == i)
        _choices[i] = _answer;
      else
        _choices[i] = _getRandomAnswer();
    }
  }

  _initialise() {
    _value = _getRandomSymbol();
    _answer = _getAnswer(_value);
    _initialiseChoices();
    _buttonsEnabled = [true,true,true];
  }

}
