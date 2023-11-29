import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:flutter/services.dart';
import '../model/model.dart';

// Mock fortune service that grabs sample json data to mock recipe request/response
class FortuneService {
  // Batch request that gets both today fortune and friend's feed
  Future<ExploreData> getExploreData() async {
    final dailyFortunes = await _getDailyFortunes();
    // todo implement constellation
    // then
    // final constellationFortunes = await _getConstellation();

    return ExploreData(dailyFortunes);
    // return ExploreData(dailyFortnes, constellationFortunes);
  }

  // Get sample explore fortunes json to display in ui
  Future<DynamicDailyFortunes> _getDailyFortunes() async {
    try {
      // Simulate api request wait time
      await Future.delayed(const Duration(milliseconds: 1000));
      // todo get json from internet
      // Load json from file system
      // Serialization -> get json file as string
      final dataString =
          await _loadAsset('assets/sample_data/sample_daily_fortune.json');
      debugPrint('load Asset completed');

      // Decode to json, Deserialization
      // reconstruct the object model.
      Map<String, dynamic> parsedJson = jsonDecode(dataString);

      // Go through each fortune and convert json to ExploreFortune object.
      late final DynamicDailyFortunes _dailyFortunes;
      debugPrint('${parsedJson['result'].runtimeType}');
      if (parsedJson != null && parsedJson['result'] != null) {
        debugPrint('parsedJson 내용 : ${parsedJson['result']}');

        _dailyFortunes = DynamicDailyFortunes.fromJson(parsedJson['result']);

        // todo set yearIdx, condstellationIdx

        return _dailyFortunes;
      } else {
        debugPrint('Error: JSON is null or missing "result" key.');
        return new DynamicDailyFortunes(contents: null);
      }
    } catch (e) {
      debugPrint('Error fetching or decoding daily fortunes: $e');
      return new DynamicDailyFortunes(contents: null);
    }
  }



  // Loads sample json data from file system
  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}
