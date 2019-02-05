import 'package:flutter/material.dart';
import 'package:tp3/util/strings.dart';
import 'package:tp3/app/learn/learn.dart';
import 'package:tp3/app/training//training.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    Learn(),
    Training(),
  ];

  PageController _pageController = PageController(viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    var strings = Strings.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(strings.title),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _children.length,
        onPageChanged: (int index){onPageChanged(index);},
        itemBuilder: (BuildContext context, int index){
          return _children.elementAt(index);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.explore),
            title: new Text(strings.learn),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.edit),
            title: new Text(strings.train),
          ),
        ],
      ),
    );
  }

  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }
}
