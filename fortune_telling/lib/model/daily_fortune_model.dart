import 'package:intl/intl.dart';

class FortuneBundle {
  DateTime date;
  List<Fortune> fortunes;

  FortuneBundle(this.date, this.fortunes);

  // ignore: lines_longer_than_80_chars
  static const String content =
      '''
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''';

  static List<FortuneBundle> samples = [
    // Fortunes(
    //   DateTime.now().add(const Duration(days: -1)),
    //   [
    //     Fortune(0, 10, content),
    //     Fortune(1, 20, content),
    //     Fortune(2, 30, content),
    //     Fortune(3, 40, content),
    //   ],
    // ),
    FortuneBundle(
      DateTime.now().add(const Duration(days: 0)),
      [
        Fortune(0, 15, content),
        Fortune(1, 25, '애정운'),
        Fortune(2, 35, '재물운'),
        Fortune(3, 45, '직장운'),
        Fortune(3, 45, '학업 시험운'),
      ],
    ),
    FortuneBundle(
      DateTime.now().add(const Duration(days: 1)),
      [
        Fortune(0, 50, content),
        Fortune(1, 60, '애정운'),
        Fortune(2, 70, '재물운'),
        Fortune(3, 80, '직장운'),
        Fortune(3, 90, '학업 시험운'),
      ],
    ),
  ];
}

class Fortune {
  static const List<String> names = ['총운', '재물운', '연애운', '소망운'];
  int idx;
  String? name;
  int score;
  String? content;

  Fortune(int idx, int score, this.content)
      : idx = idx,
        score = score {
    name = names[idx];
  }
}
