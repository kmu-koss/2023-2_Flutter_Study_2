import 'package:flutter/foundation.dart';

import 'model.dart';

class DynamicDailyFortunes {
  int _yearIdx = 0;
  int _constellationIdx = 0;
  List<DynamicDailyFortuneInfo>? contents;

  DynamicDailyFortunes({
    int yearIdx = 0,
    int constellationIdx = 0,
    required contents,
  })  : _constellationIdx = constellationIdx,
        _yearIdx = yearIdx;

  factory DynamicDailyFortunes.fromJson(Map<String, dynamic> parsedJson) {
    try {
      return DynamicDailyFortunes(
        contents: <DynamicDailyFortuneInfo>[
          DynamicDailyFortuneInfo.fromJson(parsedJson['day']),
          DynamicDailyFortuneInfo.fromJson(parsedJson['tomorrow']),
        ],
      );
    } catch (e) {
      // 예외가 발생한 경우 실행되는 블록
      debugPrint('DynamicDailyFortunes fromJson 에러: $e');
      return DynamicDailyFortunes(
        contents: [
          DynamicDailyFortuneInfo(
            title: 'title',
            date: 'date',
            dailyContent: <DynamicEachFortune>[
              DynamicEachFortune(idx: 0, name: '', desc: '', keyword: ''),
            ],
          ),
        ],
      );
    } finally {
      // 예외 발생 여부와 관계없이 항상 실행되는 블록
      debugPrint('DynamicDailyFortunes fromJson 메소드 완료');
      debugPrint('${parsedJson['day']}');
      debugPrint('''
${DynamicDailyFortuneInfo.fromJson(parsedJson['day']).dailyContent?[0].name}''');
    }
  }

  // getter
  int get yearIdx => _yearIdx;

  int get constellationIdx => _constellationIdx;

  // setter
  set yearIdx(int value) {
    _yearIdx = value;
  }

  set constellationIdx(int value) {
    _constellationIdx = value;
  }
}

class DynamicDailyFortuneInfo {
  String? title;
  String? date;

  List<DynamicEachFortune>? dailyContent;

  DynamicDailyFortuneInfo(
      {required String? title,
      required String? date,
      required this.dailyContent});

  factory DynamicDailyFortuneInfo.fromJson(Map<String, dynamic> parsedJson) {
    try {
      return DynamicDailyFortuneInfo(
        title: parsedJson['title'] as String,
        date: parsedJson['date'] as String,
        dailyContent: List.generate(
              parsedJson['content'].length - 1,
              (index) =>
                  DynamicEachFortune.fromJson(parsedJson['content'][index]),
            ) ??
            [
              DynamicEachFortune(
                idx: 0,
                name: '',
                desc: '',
                keyword: '',
              )
            ],
      );
    } catch (e) {
      // 예외가 발생한 경우 실행되는 블록
      debugPrint('DynamicDailyFortuneInfo fromJson 에러: $e');
      // 예외 처리 후 반환할 기본값 또는 다른 로직을 여기에 추가할 수 있습니다.
      return DynamicDailyFortuneInfo(
        title: '',
        date: '',
        dailyContent: [
          DynamicEachFortune(
            idx: 0,
            name: '',
            desc: '',
            keyword: '',
          )
        ],
      );
    } finally {
      // 예외 발생 여부와 관계없이 항상 실행되는 블록
      debugPrint('DynamicDailyFortuneInfo fromJson 완료');
      debugPrint('${parsedJson['date']}');
      // ok
      // debugPrint('${DynamicEachFortune.fromJson(parsedJson['content'][4]).desc}');
    }
  }
}

class DynamicEachFortune {
  int? idx;
  String? name;
  String? desc;
  String? keyword;

  // int? score;
  String? iconUrl = 'assets/icon/0.png';

  DynamicEachFortune({
    required this.idx,
    required this.name,
    required this.desc,
    required this.keyword,
  }) {
    iconUrl = 'assets/icon/$idx.png';
  }

  factory DynamicEachFortune.fromJson(Map<String, dynamic> parsedJson) {
    return DynamicEachFortune(
      idx: 0,
      name: parsedJson['name'] as String ?? 'empty',
      desc: parsedJson['desc'] as String ?? 'empty',
      keyword: parsedJson['keyword'] as String ?? 'empty',
    );
  }
}
