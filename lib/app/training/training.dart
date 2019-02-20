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
    return OrientationBuilder(builder: (context, orientation) {
      return AspectRatio(
        aspectRatio: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: orientation == Orientation.portrait ? 6 : 3,
              child: Symbol(
                value: _value,
              ),
            ),
            Expanded(
              flex: 3,
              child: ListView(
                //BEN_CORRECTION : Code qui se répète. Une boucle aurait du être utilisée.
                children: <Widget>[
                  FlatButton(
                    child: Text(_choices.elementAt(0)),
                    textColor: _buttonsEnabled.elementAt(0)
                        ? Colors.black
                        : Colors.red,
                    onPressed: () => _buttonsEnabled.elementAt(0)
                        ? onChoiceButtonPressed(0)
                        : null,
                  ),
                  FlatButton(
                    child: Text(_choices.elementAt(1)),
                    textColor: _buttonsEnabled.elementAt(1)
                        ? Colors.black
                        : Colors.red,
                    onPressed: () => _buttonsEnabled.elementAt(1)
                        ? onChoiceButtonPressed(1)
                        : null,
                  ),
                  FlatButton(
                    child: Text(_choices.elementAt(2)),
                    textColor: _buttonsEnabled.elementAt(2)
                        ? Colors.black
                        : Colors.red,
                    onPressed: () => _buttonsEnabled.elementAt(2)
                        ? onChoiceButtonPressed(2)
                        : null,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();

    //BEN_CORRECTION : Constante manquante.
    if(PageStorage.of(context).readState(context, identifier: "choices") == null){
      _initialise();
    }

    else{
      //BEN_CORRECTION : Constante manquante.
      _choices = PageStorage.of(context).readState(context, identifier: "choices");
      //BEN_CORRECTION : Constante manquante.
      _value = PageStorage.of(context).readState(context, identifier: "value");
      //BEN_CORRECTION : Constante manquante.
      _answer = PageStorage.of(context).readState(context, identifier: "answer");

      //BEN_CORRECTION : Constante manquante.
      _buttonsEnabled = PageStorage.of(context).readState(context, identifier: "buttonsEnabled");
    }

  }

  onChoiceButtonPressed(int buttonIndex) {
    setState(() {

      if (_choices.elementAt(buttonIndex) == _answer)
        _initialise();
      else{
        _buttonsEnabled[buttonIndex] = false;
        PageStorage.of(context).writeState(context, _buttonsEnabled, identifier: "buttonsEnabled");
      }

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

    PageStorage.of(context).writeState(context, _choices,
    identifier: "choices");
  }

  _initialise() {
      _value = _getRandomSymbol();
      _answer = _getAnswer(_value);
      _initialiseChoices();
      _buttonsEnabled = [true, true, true];

      PageStorage.of(context).writeState(context, _value, identifier: "value");
      PageStorage.of(context).writeState(context, _answer, identifier: "answer");
      PageStorage.of(context).writeState(context, _buttonsEnabled, identifier: "buttonsEnabled");
  }

}
