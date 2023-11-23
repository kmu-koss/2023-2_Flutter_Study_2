import 'package:flutter/material.dart';
import 'package:fooderlich/fooderlich_theme.dart';

import 'main.dart';

class Card3 extends StatelessWidget {
  const Card3({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(width: 350, height: 450),
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage('assets/mag2.png'), fit: BoxFit.cover),
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.book,
                    color: Colors.white,
                    size: 42,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Recipe Trend',
                    style: FooderlichTheme.darkTextTheme.headline6,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 4,
                    children: [
                      Chip(
                        onDeleted: (){
                          print('on chip deleted');
                        },
                        label: Text(
                          'healthy',
                          style: FooderlichTheme.darkTextTheme.bodyText1,
                        ),
                      ),

                      Chip(
                        label: Text(
                          'Vegan',
                          style: FooderlichTheme.darkTextTheme.bodyText1,
                        ),
                      ),

                      Chip(
                        label: Text(
                          'Carrots',
                          style: FooderlichTheme.darkTextTheme.bodyText1,
                        ),
                      ),

                      Chip(
                        label: Text(
                          'Greens',
                          style: FooderlichTheme.darkTextTheme.bodyText1,
                        ),
                      ),

                      Chip(
                        label: Text(
                          'Wheat',
                          style: FooderlichTheme.darkTextTheme.bodyText1,
                        ),
                      ),

                      Chip(
                        label: Text(
                          'Pescetarian',
                          style: FooderlichTheme.darkTextTheme.bodyText1,
                        ),
                      ),

                      Chip(
                        label: Text(
                          'Mint',
                          style: FooderlichTheme.darkTextTheme.bodyText1,
                        ),
                      ),

                      Chip(
                        label: Text(
                          'Lemongrass',
                          style: FooderlichTheme.darkTextTheme.bodyText1,
                        ),
                      ),

                      Chip(
                        label: Text(
                          'Salad',
                          style: FooderlichTheme.darkTextTheme.bodyText1,
                        ),
                      ),

                      Chip(
                        label: Text(
                          'Water',
                          style: FooderlichTheme.darkTextTheme.bodyText1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
