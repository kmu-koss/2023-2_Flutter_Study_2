import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../graph.dart';
import '../fortune_telling_theme.dart';

class Card2 extends StatefulWidget {
  const Card2({Key? key}) : super(key: key);

  @override
  State<Card2> createState() => _Card2State();
}

class _Card2State extends State<Card2> {
  final String info = 'Fortune';
  final List<String> Constellation= ['none', 'Aquarius', 'Pisces', 'Aries', 'Gemini', '''
Taurus''', 'Cancer', 'Leo', 'Virgo', 'Libra', 'Scorpip', 'Sagittarius', 'Capricorn'];
  double order = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints.expand(width: 350, height: 450),
        decoration: BoxDecoration(
          image:  DecorationImage(
              image: AssetImage('assets/constellation/${order.toInt()}.jpg'), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            const Expanded(
              child: Text('''
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'''),
            ),
            Slider(
                value: order,
                label: Constellation[order.toInt()],
                min: 1,
                max: 12,
                divisions: 11,
                onChanged: (value) {
                  print('$order');
                  setState(() {
                    order = value;
                  });
                }),
          ],

        ),
      ),
    );
  }
}
