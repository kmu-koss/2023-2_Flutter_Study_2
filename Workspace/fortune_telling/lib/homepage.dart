import 'package:flutter/material.dart';
import 'package:fortune_telling/fortune_telling_theme.dart';
import 'home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = FortuneTellingTheme.dark();
    // 3
    return MaterialApp(
      theme: theme,
      title: 'Fortune Telling',
      // 4
      home: const Home(),
    );
  }
}
