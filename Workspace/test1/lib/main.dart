import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('InkWell 및 반복문 예제'),
        ),
        body: MyColumnWidget(),
      ),
    );
  }
}

class MyColumnWidget extends StatelessWidget {
  final List<String> widgetTitles = ['첫 번째 위젯', '두 번째 위젯', '세 번째 위젯'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widgetTitles.map((title) {
        return InkWell(
          onTap: () {
            // 각 위젯을 탭했을 때 실행할 작업을 여기에 추가
            print('$title 이 탭되었습니다.');
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(title),
            ),
          ),
        );
      }).toList(),
    );
  }
}
