import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../fortune_telling_theme.dart';
import '../model/daily_fortune_model.dart';
import '../graph.dart';
import 'screen.dart';

class FortuneDetail extends StatefulWidget {
  final FortuneBundle fortuneBundle;

  const FortuneDetail({
    super.key,
    required this.fortuneBundle,
  });

  @override
  State<StatefulWidget> createState() {
    return _FortuneDetailState();
  }
}

class _FortuneDetailState extends State<FortuneDetail> {
  @override
  Widget build(BuildContext context) {
    final dateStr = DateFormat('yyyy-MM-dd').format(widget.fortuneBundle.date);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fortune Telling',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return _buildCard(
            widget.fortuneBundle.fortunes[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 16,
          );
        },
        itemCount: widget.fortuneBundle.fortunes.length,
      ),
      // body: Container(
      //   width: double.maxFinite,
      //   decoration: const BoxDecoration(
      //     image: DecorationImage(
      //         image: AssetImage('assets/night_bg.jpg'),
      //         fit: BoxFit.cover,),
      //   ),
      //   child: Column(
      //     children: [
      //       Text(
      //         dateStr,
      //         style: Theme.of(context).textTheme.displayLarge,
      //       ),
      //       const SizedBox(
      //         height: 10,
      //       ),
      //       SizedBox(
      //         height: 500,
      //         child: ListView.separated(
      //           padding: const EdgeInsets.symmetric(horizontal: 16),
      //           scrollDirection: Axis.horizontal,
      //           itemBuilder: (BuildContext context, int index) {
      //             return _buildCard(
      //               widget.fortuneBundle.fortunes[index],
      //             );
      //           },
      //           separatorBuilder: (BuildContext context, int index) {
      //             return const SizedBox(
      //               width: 16,
      //             );
      //           },
      //           itemCount: widget.fortuneBundle.fortunes.length,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );

    // throw UnimplementedError();
  }

  Widget _buildCard(Fortune fortune) {
    if (fortune.idx > -11) {
      return FortuneCard(
        fortune: fortune,
      );
    } else {
      throw Exception('This card does not exist');
    }
  }
}
