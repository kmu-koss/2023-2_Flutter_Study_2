import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'fooderlich_theme.dart';
import 'home.dart';
import 'models/tab_manager.dart';

void main() {
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {
  const Fooderlich({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.light();
    return MaterialApp(
      theme: theme,
      title: 'Fooderlich',
      // TODO: Replace this with MultiProvider
      home: ChangeNotifierProvider<TabManger>(
        create:(context){
          return TabManger();
        },
          builder: (BuildContext context, Widget? child) {
          return const Home();
        }
      ),
    );
  }
}
