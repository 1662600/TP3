import 'package:flutter/material.dart';
import 'package:tp3/app/hiragana//symbol.dart';
import 'package:tp3/app/hiragana/hiragana.dart';

class Learn extends StatefulWidget {
  @override
  LearnState createState() {
    return new LearnState();
  }
}

class LearnState extends State<Learn> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return GridView.count(
        controller: _scrollController,
        crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
        children: List.generate(Hiraganas.length, (index) {
          return Symbol(
            value: Hiraganas.keys.elementAt(index),
            translation: Hiraganas.values.elementAt(index),
          );
        }),
      );
    });
  }

  @override
  void initState() {
    super.initState();


    //BEN_CORRECTION : Constante manquante.
    if (PageStorage.of(context).readState(context, identifier: "scrollOffset") != null){

      _scrollController = ScrollController(
          initialScrollOffset: PageStorage.of(context)
          //BEN_CORRECTION : Constante manquante.
              .readState(context, identifier: "scrollOffset")
      );
    }

    _scrollController.addListener(_onScroll);
  }

  _onScroll() {
    PageStorage.of(context).writeState(context, _scrollController.offset,
        //BEN_CORRECTION : Constante manquante.
        identifier: "scrollOffset");
  }
}
