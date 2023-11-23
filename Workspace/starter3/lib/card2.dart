import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'author_card.dart';
import 'fooderlich_theme.dart';

class Card2 extends StatelessWidget {
  const Card2({Key? key}) : super(key: key);

  final String name = 'Mike Katz';
  final String nickname = 'Smoothie Connoisseur';
  final String food = 'Smoothies';
  final String info = 'Recipe';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: const EdgeInsets.all(16),
          constraints: const BoxConstraints.expand(width: 350, height: 450),
          decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage('assets/mag5.png'), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              const AuthorCard(
                authorName: 'Mike Katz',
                title: 'Smoothie Consecutr',
                imageProvider: AssetImage('assets/author_katz.jpeg'),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 32.0),
                      child: RotatedBox(
                        quarterTurns: -1,
                        child: Text(
                          'Smoothie',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                    ),
                    Text(
                      'recipes',
                      style: Theme.of(context).textTheme.headline1,
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
