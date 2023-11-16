import 'package:flutter/material.dart';

import 'fortune_telling_theme.dart';
import 'home.dart';


void main() {
  // 1
  runApp(const FortuneTelling());
}

class FortuneTelling extends StatelessWidget {
  // 2
  const FortuneTelling({super.key});

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
