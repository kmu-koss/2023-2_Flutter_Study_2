import 'model.dart';

class DynamicDailyFortunes {
  String title;
  String date;
  List<DynamicDailyFortune> content;

  DynamicDailyFortunes({
    required this.title,
    required this.date,
    required this.content
  });

  factory DynamicDailyFortunes.fromJson(Map<String, dynamic> json) {
    return DynamicDailyFortunes(
      title: json['title'] ?? '',
      date: json['date'] ?? '',
      content: json['content'] ?? [DynamicDailyFortune( idx: 0, name: ''
          , desc: '', score: 0)],
    );
  }
}

class DynamicDailyFortune{
  int? idx;
  String? name;
  String? desc;
  int? score;
  String? iconUrl = 'assets/icon/0.png';

  DynamicDailyFortune({
    this.idx = 0,
    this.name = '',
    this.desc = '',
    this.score = 0,
  }
  ){
    iconUrl = 'assets/icon/$idx.png';
  }

}