import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'fortune_telling_theme.dart';
import 'model/daily_fortune_model.dart';
import 'graph.dart';

class FortuneDetail extends StatefulWidget {
  final FortuneBundle fortune;

  const FortuneDetail({Key? key, required this.fortune}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FortuneDetailState();
  }
}

class _FortuneDetailState extends State<FortuneDetail> {
  @override
  Widget build(BuildContext context) {
    final dateStr = DateFormat('yyyy-MM-dd').format(widget.fortune.date);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fortune Telling',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            constraints: const BoxConstraints.expand(width: 350, height: 450),
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/night_bg.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        height: 50,
                        // color: Colors.yellow,
                        child: Text(
                          dateStr,
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ),
                    ),

                    Expanded(
                      child: ListView.builder(
                        itemCount: widget.fortune.fortunes.length,
                        itemBuilder: (context, index) {
                          final luck = widget.fortune.fortunes[index];
                          return Column(
                            children: [
                              const SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                '${luck.name}',
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '${luck.content}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // throw UnimplementedError();
  }
}

class LuckList extends State<FortuneDetail> {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
