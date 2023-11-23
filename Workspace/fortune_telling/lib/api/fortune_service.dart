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
  Future<List<DynamicDailyFortunes>> _getDailyFortunes() async {
    try {
      // Simulate api request wait time
      await Future.delayed(const Duration(milliseconds: 1000));
      // todo get json from internet
      // Load json from file system
      final dataString =
      await _loadAsset('assets/sample_data/sample_daily_fortune.json');
      // debugPrint(dataString);
      // Decode to json
      // todo to solve
      Map<String, Map<String, Map<String, dynamic>>> json =
          jsonDejcode(dataString);
      // Go through each fortune and convert json to ExploreFortune object.

      // final Map<String, Object> tmp = json['result'] as Map<String, Object>;

      if (json != null &&  json['result'] !=null) {
        // debugPrint(json['result']?['day']);
        final _dailyFortunes = <DynamicDailyFortunes>[];
        json['result']?.forEach((key, value) {
          _dailyFortunes.add(DynamicDailyFortunes.fromJson(value));
        });
        // debugPrint(json['result']['day']['title']);
        return _dailyFortunes;
      } else {
        debugPrint('Error: JSON is null or missing "result" key.');
        return [];
      }
    } catch (e) {
      debugPrint('Error fetching or decoding daily fortunes: $e');
      return [];
    }
  }

  // Get the sample friend json posts to display in ui
  // Future<List<Post>> _getConstellation() async {
  //   // Simulate api request wait time
  //   await Future.delayed(const Duration(milliseconds: 1000));
  //   // Load json from file system
  //   final dataString =
  //   await _loadAsset('assets/sample_data/sample_friends_feed.json');
  //   // Decode to json
  //   final Map<String, dynamic> json = jsonDecode(dataString);
  //
  //   // Go through each post and convert json to Post object.
  //   if (json['feed'] != null) {
  //     final posts = <Post>[];
  //     json['feed'].forEach((v) {
  //       posts.add(Post.fromJson(v));
  //     });
  //     return posts;
  //   } else {
  //     return [];
  //   }
  // }

  // Loads sample json data from file system
  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}
