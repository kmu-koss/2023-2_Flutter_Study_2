import 'package:intl/intl.dart';

class StaticDailyFortuneBundle {
  DateTime date;
  List<StaticDailyFortune> fortunes;

  StaticDailyFortuneBundle(this.date, this.fortunes);
  static const String imageDir = '/home/seonu/kmu/koss/flutter_study/fortune_telling/assets/icon';

  // ignore: lines_longer_than_80_chars
  static const String content = '''
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''';

  static List<StaticDailyFortuneBundle> samples = [
    StaticDailyFortuneBundle(
      DateTime.now().add(const Duration(days: 0)),
      [
        StaticDailyFortune(idx: 0, score: 15, desc: content, iconUrl: 'assets/icon/0.png'),
        StaticDailyFortune(idx: 1, score: 25, desc: content, iconUrl: 'assets/icon/1.png'),
        StaticDailyFortune(idx: 2, score: 35, desc: content, iconUrl: 'assets/icon/2.png'),
        StaticDailyFortune(idx: 3, score: 45, desc: content, iconUrl: 'assets/icon/3.png'),
        StaticDailyFortune(idx: 4, score: 55, desc: content, iconUrl: 'assets/icon/4.png'),

      ],
    ),
    StaticDailyFortuneBundle(
      DateTime.now().add(const Duration(days: 1)),
      [
        StaticDailyFortune(idx: 0, score: 15, desc: content, iconUrl: 'assets/icon/0.png'),
        StaticDailyFortune(idx: 1, score: 25, desc: content, iconUrl: 'assets/icon/1.png'),
        StaticDailyFortune(idx: 2, score: 35, desc: content, iconUrl: 'assets/icon/2.png'),
        StaticDailyFortune(idx: 3, score: 45, desc: content, iconUrl: 'assets/icon/3.png'),
        StaticDailyFortune(idx: 4, score: 55, desc: content, iconUrl: 'assets/icon/4.png'),
      ],
    ),
  ];
}

class StaticDailyFortune {
  static const List<String> names = ['총운', '애정운', '금전운', '직장운', '학업운'];
  int idx;
  String? name;
  int score;
  String desc;
  String iconUrl;

  StaticDailyFortune(
      {required this.idx,
      required this.score,
      required this.desc,
      required this.iconUrl}) {
    name = names[idx];
  }
}
