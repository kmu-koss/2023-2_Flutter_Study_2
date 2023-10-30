import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'fooderlich_theme.dart';
import 'recipe_detail.dart';
import 'recipe_model.dart';

class Card1 extends StatelessWidget {
  const Card1({Key? key}) : super(key: key);

  final String category = 'Editor\'s Choice';
  final String title = 'The Art of Dough';
  final String description = 'Learn to make the perfect bread.';
  final String chef = 'Ray Wenderlich';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints.expand(width: 350, height: 450),
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage('assets/mag1.png'), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListView.builder(
            itemCount: 4, //어제, 오늘, 내일, 지정일
            itemBuilder: (BuildContext context, int index) {
              try {
                return GestureDetector(
                    onTap: () {
                      // when user tap, this body code runs
                      print(Recipe.samples[index].label);
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) {
                        return RecipeDetail(
                          recipe: Recipe.samples[index],
                        );
                      }));
                    },
                    child: Text('test'),
                );
              } catch (e, s) {
                print(s);
              }
            }),
      ),
    );
  }
}
