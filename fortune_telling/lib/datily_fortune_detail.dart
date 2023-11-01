import 'package:flutter/material.dart';

import 'daily_fortune_model.dart';
import 'graph.dart';

class FortuneDetail extends StatefulWidget {
  final Fortune fortune;

  const FortuneDetail({Key? key, required this.fortune}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FortuneDetailState();
  }
}

class _FortuneDetailState extends State<FortuneDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.fortune.day),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Graph(),
            Expanded(
              child: ListView.builder(
                itemCount: widget.fortune.Lucks.length,
                itemBuilder: (context, index) {
                  final luck = widget.fortune.Lucks[index];
                  return Column(
                    children:[
                      Text('Luck ${luck.name}'),
                      Text('Luck ${luck.content}'),
                    ]

                  );
                },
              ),
            ),
          ],
        ),
      ),
    );

    // return Center(
    //   child: Container(
    //     padding: const EdgeInsets.only(left: 16, top: 32, right: 16, bottom: 16),
    //     constraints: const BoxConstraints.expand(width: 350, height: 450),
    //     decoration: BoxDecoration(
    //       image: const DecorationImage(
    //           image: AssetImage('assets/night_bg.jpg'), fit: BoxFit.cover),
    //       borderRadius: BorderRadius.circular(16),
    //     ),
    //     child: Column(
    //       children: [
    //         Graph(),
    //         Expanded(
    //           child: ListView.builder(
    //             itemCount: widget.fortune.Lucks.length,
    //             itemBuilder: (context, index) {
    //               final luck = widget.fortune.Lucks[index];
    //               return Column(
    //                   children:[
    //                     Text('Luck ${luck.name}'),
    //                     Text('Luck ${luck.content}'),
    //                   ]
    //
    //               );
    //             },
    //           ),
    //         ),
    //       ],
    //     ),
    //   // ),
    // );
    // throw UnimplementedError();
  }
}

class LuckList extends State<FortuneDetail> {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}