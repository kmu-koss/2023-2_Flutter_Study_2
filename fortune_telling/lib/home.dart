import 'package:flutter/material.dart';
import 'package:fooderlich/card1.dart';
import 'package:fooderlich/card2.dart';
import 'package:fooderlich/card3.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    Card1(),
    Card2(),
    Card3(),
  ];

  void _onItemClick(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Fooderlich',
        style: Theme.of(context).textTheme.titleLarge,
      )),
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) => _onItemClick(index),
        // (int idneX){ _onItemClick(inddx); } 와 같음.
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.content_paste_outlined),
            label: 'Today Forutne',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_outline_rounded),
            label: 'Constellation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz_rounded),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
