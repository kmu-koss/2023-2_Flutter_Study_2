import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'circle_image.dart';

class Graph extends StatefulWidget {
  const Graph({
    super.key,
  });

  @override
  State<Graph> createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  bool iconClicked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('100 \n 총운'),
        SizedBox(
          width: 200,
          height: 100,
          child: IconButton(
            onPressed: () {
              print('icon clicked');
              iconClicked = !iconClicked;
              setState(() {});
              const snackBar = SnackBar(content: Text('Favorite clicked'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            icon: Icon(iconClicked ? Icons.favorite : Icons.favorite_border),
          ),
        ),
        Expanded(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('99 \n 애정운'),
            Text('89 \n금전운'),
            Text('88 \n 소망운'),
          ]),
        )
      ],
    );
  }
}

// class Status {
//
//   String? name;
//   int score;
//   String? content;
//
//   Status(this.idx, this.score, this.content) {
//     name = names[idx];
//   }
// }
