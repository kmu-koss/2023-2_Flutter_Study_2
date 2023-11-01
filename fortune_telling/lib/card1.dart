import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'daily_fortune_model.dart';
import 'datily_fortune_detail.dart';
import 'fooderlich_theme.dart';

class Card1 extends StatelessWidget {
  Card1({super.key});


  final List<String> widgetTitles = ['Yesterday', 'Today', 'Tomorrow'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 16, top: 32, right: 16, bottom: 16),
        constraints: const BoxConstraints.expand(width: 350, height: 450),
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage('assets/night_bg.jpg'), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: widgetTitles.asMap().entries.map((entry) {
            final index = entry.key;
            final title = entry.value;

            return InkWell(
              onTap: () {
                // 각 위젯을 탭했을 때 실행할 작업을 여기에 추가
                print('$index, $title 이 탭되었습니다.');
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FortuneDetail(
                    fortune: Fortune.samples[index],
                  );
                }));
              },
              child: SizedBox(
                width: 300,
                height: 100,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(title),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
