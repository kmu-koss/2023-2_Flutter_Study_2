import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../model/model.dart';
import 'screen.dart';
import '../fortune_telling_theme.dart';

class FortuneScreen extends StatelessWidget {
  FortuneScreen({super.key});

  final List<String> widgetTitles = ['Today', 'Tomorrow'];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(width: 350, height: 600),
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage('assets/background/moon_bg.jpg'), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: widgetTitles.asMap().entries.map((entry) {
            final index = entry.key;
            final title = entry.value;

            return InkWell(
              onTap: () {
                // 각 위젯을 탭했을 때 실행할 작업을 여기에 추가
                print('$index, $title 이 탭되었습니다.');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return FortuneDetail(
                        //Todo data 채워야함.
                        // fortuneBundle: StaticDailyFortuneBundle.samples[index],
                        info: Info(),
                        choice: index,
                      );
                    },
                  ),
                );
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
