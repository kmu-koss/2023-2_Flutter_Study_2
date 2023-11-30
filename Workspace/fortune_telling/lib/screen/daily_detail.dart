import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../api/fortune_service.dart';
import '../components/components.dart';
import '../fortune_telling_theme.dart';
import '../model/model.dart';
import 'screen.dart';

class FortuneDetail extends StatefulWidget {
  // final StaticDailyFortuneBundle fortuneBundle;
  // final Future<ExploreData>? fortunes;
  final fortuneService = FortuneService();
  final Info info;
  int choice = 0;

  FortuneDetail({
    super.key,
    required this.info,
    required this.choice,
  });

  @override
  State<StatefulWidget> createState() {
    return _FortuneDetailState();
  }
}

class _FortuneDetailState extends State<FortuneDetail> {
  late var _dynamicDailyFortuneInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fortune Telling',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background/night_bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder(
          future: widget.fortuneService.getExploreData(),
          builder: (context, AsyncSnapshot<ExploreData> snapshot) {
            try {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                _dynamicDailyFortuneInfo =
                    snapshot.data?.dailyFortunes.contents?[widget.choice] ?? '';
                debugPrint(_dynamicDailyFortuneInfo);
                return Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      _dynamicDailyFortuneInfo.date,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 500,
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return _buildCard(
                            _dynamicDailyFortuneInfo.dailyContent.length > index
                                ? _dynamicDailyFortuneInfo.dailyContent[index]
                                : DynamicEachFortune(
                                    idx: 0, name: '', desc: '', keyword: ''),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: 16,
                          );
                        },
                        itemCount: _dynamicDailyFortuneInfo.content.length ?? 1,
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            } catch (e) {
              // Handle any exceptions here
              debugPrint('Error in building UI: $e');
              debugPrint('${snapshot.data?.dailyFortunes.contents?[0]}');
              return const Center(
                child: Text('An error occurred while building UI.'),
              );
            }
          },
        ),
      ),
    );
  }
}

Widget _buildCard(DynamicEachFortune fortune) {
  try {
    return FortuneCard(
      d_fortune: fortune,
    );
  } catch (e) {
    throw Exception('This card does not exist');
  }
}
