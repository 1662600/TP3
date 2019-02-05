import 'package:flutter/material.dart';

class Symbol extends StatelessWidget {

  final String _value;
  final String _translation;

  Symbol({String value = '', String translation = '' }) : _value = value, _translation = translation;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        child: FittedBox(
          child: Column(
            children: <Widget>[
              Text(
                _value.toString(),
                textScaleFactor: 6,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Text(
                  _translation.toString(),
                  textScaleFactor: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

