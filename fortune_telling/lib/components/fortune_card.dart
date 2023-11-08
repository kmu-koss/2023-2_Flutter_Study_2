import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/daily_fortune_model.dart';

// import 'fortune_telling_theme.dart';
// import 'daily_fortune_model.dart';
// import 'graph.dart';

class FortuneCard extends StatefulWidget {
  final Fortune fortune;

  const FortuneCard({Key? key, required this.fortune}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FortuneCardState();
  }
}

class _FortuneCardState extends State<FortuneCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      constraints: const BoxConstraints.expand(
        width: 350,
        height: 600,
      ),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      ),
      child: ListView(
        children: [
          Container(
            height: 50,
            color: Colors.yellow,
          ),
          ListView.builder(
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Text(
                '${widget.fortune.content}',
              );
            },
          ),
        ],
      ),
    );
  }
}
