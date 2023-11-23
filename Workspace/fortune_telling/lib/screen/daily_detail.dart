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
  late final _dynamicDailyFortune;
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
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData){
              _dynamicDailyFortune = snapshot.data?.
              listDailyFortunes[widget.choice] ?? '';
              return Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    _dynamicDailyFortune.date,
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
                        // body: ListView.separated(
                        return _buildCard(
                          _dynamicDailyFortune.content[index] ??
                              DynamicDailyFortune(),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 16,
                        );
                      },
                      itemCount: _dynamicDailyFortune.content.length
                          ?? 1,
                    ),
                  ),
                ],
              );
            }else{
              return const Center(child: CircularProgressIndicator());
            }
          }
        ),
      ),
    );

    // throw UnimplementedError();
  }

  Widget _buildCard(DynamicDailyFortune fortune) {
    try {
      return FortuneCard(
        fortune: fortune,
      );
    } catch(e) {
      throw Exception('This card does not exist');
    }
  }
}
