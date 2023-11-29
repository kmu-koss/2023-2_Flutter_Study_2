import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/model.dart';
import 'components.dart';

// import 'fortune_telling_theme.dart';
// import 'static_fortune_model.dart';
// import 'graph.dart';

class FortuneCard extends StatefulWidget {
  // final StaticDailyFortune fortune;
  final DynamicEachFortune fortune;
  const FortuneCard({super.key, required this.fortune});

  @override
  State<StatefulWidget> createState() {
    return _FortuneCardState();
  }
}

class _FortuneCardState extends State<FortuneCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(30),
        constraints: const BoxConstraints.expand(width: 350, height: 400),
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Expanded(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                height: 50,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    CircleImage(
                      imageRadius: 60,
                      imageProvider: AssetImage(widget.fortune.iconUrl ?? '', ),

                    ),
                    Text(
                      '${widget.fortune.name}',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Center(
                      child: Text(
                        '??점',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Text(
                  '${widget.fortune.desc}',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
