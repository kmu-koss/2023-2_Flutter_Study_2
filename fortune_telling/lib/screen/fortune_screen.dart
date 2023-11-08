import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../model/daily_fortune_model.dart';
import 'datily_fortune_detail.dart';
import '../fortune_telling_theme.dart';

class FortuneScreen extends StatelessWidget {
  FortuneScreen({super.key});

  final List<String> widgetTitles = ['Today', 'Tomorrow'];

  @override
  Widget build(BuildContext context) {
    return Center(
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
                      fortuneBundle: FortuneBundle.samples[index],
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
    );
  }
}
