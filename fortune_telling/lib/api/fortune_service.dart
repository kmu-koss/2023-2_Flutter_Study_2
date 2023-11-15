import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;
import 'package:flutter/services.dart';
import '../model/model.dart';

// Mock recipe service that grabs sample json data to mock recipe request/response
class FortuneService {
  // Batch request that gets both today recipes and friend's feed
  Future<ExploreData> getExploreData() async {
    final dailyFortunes = await _getDailyFortunes();
    // todo implement constellation
    // final constellationFortunes = await _getConstellation();

    return ExploreData(dailyFortunes);
    // return ExploreData(dailyFortnes, constellationFortunes);
  }

  // Get sample explore recipes json to display in ui
  Future<List<DynamicDailyFortunes>> _getDailyFortunes() async {

    // Simulate api request wait time
    await Future.delayed(const Duration(milliseconds: 1000));
    // todo get json from internet
    // Load json from file system
    final dataString =

    await _loadAsset('assets/sample_data/sample_daily_fortune.json').then((dataString){
      print(dataString);
    });
    // Decode to json
    final Map<String, dynamic> json = jsonDecode(dataString);
    // Go through each recipe and convert json to ExploreRecipe object.
    if (json['result'] !=  null) {
      print(json['result']);
      final dailyFortunes = <DynamicDailyFortunes>[];
      json['result'].forEach((v) {
        dailyFortunes.add(DynamicDailyFortunes.fromJson(v));
      });
      return dailyFortunes;
    } else {
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
